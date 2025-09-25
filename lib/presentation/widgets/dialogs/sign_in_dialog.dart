import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_in/sign_in_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_in/sign_in_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_in/sign_in_state.dart';
import 'package:the_exchange_online/utils/snackbar.dart';
import 'package:the_exchange_online/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInDialog extends StatefulWidget {
  const SignInDialog({super.key});

  @override
  SignInDialogState createState() => SignInDialogState();
}

class SignInDialogState extends State<SignInDialog> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isShowPassword = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isSignInButtonEnabled() {
    return context.read<SignInBloc>().state.isFormValid &&
        !context.read<SignInBloc>().state.isSubmitting &&
        isPopulated;
  }

  void onSignIn() {
    if (isSignInButtonEnabled()) {
      context.read<SignInBloc>().add(
            SignInUser(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  void showHidePassword() {
    setState(() => _isShowPassword = !_isShowPassword);
  }

  void onForgotPassword() {
    Navigator.pushNamed(context, "AppRouter.FORGOT_PASSWORD");
  }

  ///Google sign in
  void onGoogleLogin() {
    UtilSnackBar.showSnackBarContent(context,
        content: "Button not yet supported");
    //   loginBloc.add(const LoginWithGoogleSignIn());
  }

  ///Facebook sign in
  void onFacebookLogin() {
    UtilSnackBar.showSnackBarContent(context,
        content: "Button not yet supported");
  }

  @override
  Widget build(context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        /// Logging
        if (state.isSubmitting) {
          UtilDialog.showWaiting(context);
        }

        /// Success
        if (state.isSuccess) {
          UtilDialog.hideWaiting(context);
          Navigator.of(context).pop(state.message);
        }

        /// Failure
        if (state.isFailure) {
          UtilDialog.hideWaiting(context);
          switch (state.message) {
            case "user-not-found":
              Navigator.of(context).pop(["sign_up", _emailController.text]);
              break;
            case "invalid-credential" || "INVALID_LOGIN_CREDENTIALS":
              Navigator.of(context).pop(["reset", _emailController.text]);
              break;
            default:
              UtilDialog.showInformation(
                context,
                content: state.message,
              );
          }
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          child: SizedBox(
            width: SizeConfig.defaultSize * 65,
            height: SizeConfig.defaultSize * 90,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultPadding * 3,
                  vertical: SizeConfig.defaultPadding * 5),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeaderText(),
                      SizedBox(height: SizeConfig.defaultSize * 4),
                      _buildTextEmail(),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      _buildTextFieldPassword(),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      _buildForgotPassword(),
                      SizedBox(height: SizeConfig.defaultSize * 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildButtonCancel(),
                          _buildButtonLogin(),
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

  ///Dialog Header Title
  _buildHeaderText() {
    return Text("Sign In", style: FONT_CONST.REGULAR_DEFAULT_20);
  }

  /// Build content
  _buildTextEmail() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      onChanged: (value) {
        context.read<SignInBloc>().add(EmailChanged(email: value));
      },
      validator: (_) {
        return !context.read<SignInBloc>().state.isEmailValid
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
        labelText: Translate.of(context).translate('email'),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
      ),
    );
  }

  _buildTextFieldPassword() {
    return TextFormField(
      style: FONT_CONST.REGULAR_DEFAULT_18,
      cursorColor: COLOR_CONST.greyColor,
      controller: _passwordController,
      textInputAction: TextInputAction.go,
      onChanged: (value) {
        context.read<SignInBloc>().add(PasswordChanged(password: value));
      },
      validator: (_) {
        return !context.read<SignInBloc>().state.isPasswordValid
            ? Translate.of(context).translate('invalid_password')
            : null;
      },
      onEditingComplete: onSignIn,
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.text,
      obscureText: !_isShowPassword,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.lock_outline,
          color: COLOR_CONST.greyColor,
          size: SizeConfig.defaultSize * 3,
        ),
        labelText: Translate.of(context).translate('password'),
        labelStyle: FONT_CONST.REGULAR_DEFAULT_18,
        // prefixIcon: ,
        suffixIcon: IconButton(
          icon: _isShowPassword
              ? Icon(Icons.visibility_outlined,
                  color: COLOR_CONST.greyColor,
                  size: SizeConfig.defaultSize * 3)
              : Icon(Icons.visibility_off_outlined,
                  color: COLOR_CONST.greyColor,
                  size: SizeConfig.defaultSize * 3),
          onPressed: showHidePassword,
        ),
      ),
    );
  }

  _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onForgotPassword,
        child: Text(
          Translate.of(context).translate('forgot_password'),
          style: FONT_CONST.BOLD_BLACK_20,
        ),
      ),
    );
  }

  _buildButtonLogin() {
    return TextButton(
      onPressed: onSignIn,
      child: Text(
        "Sign In",
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
    );
  }

  _buildButtonCancel() {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(
        "Cancel",
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
    );
  }
}
