// ignore_for_file: library_private_types_in_public_api

import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/data/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_up/sign_up_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_up/sign_up_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_up/sign_up_state.dart';
import 'package:the_exchange_online/presentation/widgets/buttons/offer_subscription.dart';
import 'package:the_exchange_online/utils/utils.dart';

class SignUpDialog extends StatefulWidget {
  const SignUpDialog({super.key});
  @override
  _SignUpDialogState createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _handleController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isChecked = true;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _handleController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _emailController.dispose();
    _handleController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get isPopulated =>
      _phoneNumberController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _handleController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

  bool isRegisterButtonEnabled() {
    return context.read<SignUpBloc>().state.isFormValid &&
        !context.read<SignUpBloc>().state.isSubmitting! &&
        isPopulated;
  }

  void onRegister() {
    if (isRegisterButtonEnabled()) {
      UserModel user = UserModel(
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
        handle: _handleController.text,
      );
      context.read<SignUpBloc>().add(
        SignUp(
          user: user,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
          offers: isChecked,
        ),
      );
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
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        /// Registering
        if (state.isSubmitting!) {
          UtilDialog.showWaiting(context);
        }

        /// Success
        if (state.isSuccess!) {
          UtilDialog.hideWaiting(context);
          Navigator.of(context).pop("verify_email");
        }

        /// Failure
        if (state.isFailure!) {
          UtilDialog.hideWaiting(context);
          switch (state.message) {
            case "email-already-in-use":
              Navigator.of(context).pop(["sign_in", _emailController.text]);
              break;
            default:
              UtilDialog.showInformation(context, content: state.message);
          }
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
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
                      children: [
                        _buildHeaderText(),
                        SizedBox(height: SizeConfig.defaultSize * 3),
                        _buildPhoneNumberInput(),
                        SizedBox(height: SizeConfig.defaultSize * 2),
                        _buildEmailInput(),
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
      ),
    );
  }

  _buildHeaderText() {
    return Text("Sign Up", style: FONT_CONST.BOLD_DEFAULT_20);
  }

  /// Phone number
  _buildPhoneNumberInput() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        context.read<SignUpBloc>().add(PhoneChanged(phoneNumber: value));
      },
      validator: (value) {
        return !context.read<SignUpBloc>().state.isPhoneValid!
            ? Translate.of(context).translate("invalid_phone_number")
            : null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.phone_outlined,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        labelText: Translate.of(context).translate("phone_number"),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
      ),
    );
  }

  _buildEmailInput() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      onChanged: (value) {
        context.read<SignUpBloc>().add(EmailChanged(email: value));
      },
      validator: (_) {
        return !context.read<SignUpBloc>().state.isEmailValid!
            ? Translate.of(context).translate('invalid_email')
            : null;
      },
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.email_outlined,
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
