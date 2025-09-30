import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_event.dart';
import 'package:the_exchange_online/utils/dialog.dart';
import 'package:the_exchange_online/utils/translate.dart';

class CreateShopScreen extends StatefulWidget {
  const CreateShopScreen({super.key});

  @override
  State<CreateShopScreen> createState() => _CreateShopScreenState();
}

class _CreateShopScreenState extends State<CreateShopScreen> {
  late TextEditingController _name;
  late TextEditingController _description;
  late TextEditingController _email;
  late TextEditingController _phoneNumber;
  late TextEditingController _logo;
  late TextEditingController _createdAt;
  late TextEditingController _updatedAt;

  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isChecked = true;

  @override
  void initState() {
    _name = TextEditingController();
    _description = TextEditingController();
    _email = TextEditingController();
    _phoneNumber = TextEditingController();
    _logo = TextEditingController();
    _createdAt = TextEditingController();
    _updatedAt = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _logo.dispose();
    _createdAt.dispose();
    _updatedAt.dispose();
    super.dispose();
  }

  bool get isPopulated =>
      _name.text.isNotEmpty &&
      _description.text.isNotEmpty &&
      _email.text.isNotEmpty &&
      _phoneNumber.text.isNotEmpty &&
      _logo.text.isNotEmpty;

  bool isRegisterButtonEnabled() {
    return context.read<ShopBloc>().state.isFormValid &&
        !context.read<ShopBloc>().state.isSubmitting! &&
        isPopulated;
  }

  void onCreateShop(ShopModel shop) {
    if (isRegisterButtonEnabled()) {
      final shop = ShopModel(
        name: _name.text,
        description: _description.text,
        email: _email.text,
        phoneNumber: _phoneNumber.text,
        logo: _logo.text,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        id: '',
        tenant: null,
        isActive: null,
      );
      context.read<ShopBloc>().add(CreateShop(shop));
    } else {
      UtilDialog.showInformation(
        context,
        content: Translate.of(
          context,
        ).translate("you_need_to_complete_all_fields"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateShopBloc, CreateShopState>(
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(
              SizeConfig.defaultSize * 0.3,
            ),
          ),
          child: SizedBox(
            width: SizeConfig.defaultSize * 65,
            height: SizeConfig.defaultSize * 90,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultPadding * 3,
                vertical: SizeConfig.defaultPadding * 5,
              ),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeaderText(),
                      SizedBox(height: SizeConfig.defaultSize * 3),
                      _buildName(),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      _buildDescription(),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      _buildHandleInput(),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      _buildPasswordInput(),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      _buildConfirmPasswordInput(),
                      SizedBox(height: SizeConfig.defaultSize * 3),
                      _buildRecieveOffers(),
                      SizedBox(height: SizeConfig.defaultSize * 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildButtonCancel(),
                          _buildButtonRegister(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildHeaderText() {
    return Text("Create your store", style: FONT_CONST.BOLD_DEFAULT_20);
  }

  /// Name
  _buildName() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      controller: _name,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        context.read<ShopBloc>().add(NameChanged(name: value));
      },
      validator: (value) {
        return !context.read<ShopBloc>().state.isNameValid!
            ? Translate.of(context).translate("invalid_name")
            : null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.person_outline,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        labelText: Translate.of(context).translate("name"),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
      ),
    );
  }

  _buildDescription() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      textInputAction: TextInputAction.next,
      controller: _description,
      onChanged: (value) {
        context.read<ShopBloc>().add(DescriptionChanged(description: value));
      },
      validator: (_) {
        return !context.read<ShopBloc>().state.isDescriptionValid!
            ? Translate.of(context).translate('invalid_description')
            : null;
      },
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.text_snippet_outlined,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
        labelText: Translate.of(context).translate('email'),
        // suffixIcon: Icon(Icons.email_outlined),
      ),
    );
  }

  _buildHandleInput() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      textInputAction: TextInputAction.next,
      controller: _handleController,
      onChanged: (value) {
        context.read<SignUpBloc>().add(HandleChanged(handle: value));
      },
      validator: (_) {
        return !context.read<SignUpBloc>().state.isHandleValid!
            ? Translate.of(context).translate('invalid_handle')
            : null;
      },
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.email_outlined,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
        labelText: Translate.of(context).translate('handle'),
        // suffixIcon: Icon(Icons.email_outlined),
      ),
    );
  }

  _buildPasswordInput() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      textInputAction: TextInputAction.next,
      controller: _passwordController,
      onChanged: (value) {
        context.read<SignUpBloc>().add(PasswordChanged(password: value));
      },
      validator: (_) {
        return !context.read<SignUpBloc>().state.isPasswordValid!
            ? Translate.of(context).translate('invalid_password')
            : null;
      },
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.text,
      obscureText: !isShowPassword,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
        labelText: Translate.of(context).translate('password'),
        icon: Icon(
          Icons.lock_outline,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        suffixIcon: IconButton(
          icon: isShowPassword
              ? Icon(
                  Icons.visibility_outlined,
                  color: COLOR_CONST.greyColor,
                  size: SizeConfig.defaultSize * 2,
                )
              : Icon(
                  Icons.visibility_off_outlined,
                  color: COLOR_CONST.greyColor,
                  size: SizeConfig.defaultSize * 2,
                ),
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
        ),
      ),
    );
  }

  _buildConfirmPasswordInput() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      textInputAction: TextInputAction.done,
      controller: _confirmPasswordController,
      onChanged: (value) {
        context.read<SignUpBloc>().add(
          ConfirmPasswordChanged(
            password: _passwordController.text,
            confirmPassword: value,
          ),
        );
      },
      validator: (_) {
        return !context.read<SignUpBloc>().state.isConfirmPasswordValid!
            ? Translate.of(context).translate('don\'t_match_password')
            : null;
      },
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.text,
      obscureText: !isShowConfirmPassword,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.lock_outline,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        labelText: Translate.of(context).translate('confirm_password'),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
        suffixIcon: IconButton(
          icon: isShowConfirmPassword
              ? Icon(
                  Icons.visibility_outlined,
                  color: COLOR_CONST.greyColor,
                  size: SizeConfig.defaultSize * 2,
                )
              : Icon(
                  Icons.visibility_off_outlined,
                  color: COLOR_CONST.greyColor,
                  size: SizeConfig.defaultSize * 2,
                ),
          onPressed: () {
            setState(() {
              isShowConfirmPassword = !isShowConfirmPassword;
            });
          },
        ),
      ),
    );
  }

  Widget _buildRecieveOffers() {
    return OfferSubscription(
      title: "I want to recieve offers",
      leader: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }

  _buildButtonRegister() {
    return TextButton(onPressed: onRegister, child: const Text("Sign Up"));
  }

  _buildButtonCancel() {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text("Cancel"),
    );
  }
}
