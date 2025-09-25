import 'dart:ui';

import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:the_exchange_online/presentation/widgets/dialogs/verification_dialog.dart';
import 'package:the_exchange_online/presentation/widgets/dialogs/sign_in_dialog.dart';
import 'package:the_exchange_online/presentation/widgets/custom_widgets.dart';
import 'package:the_exchange_online/presentation/widgets/dialogs/sign_up_dialog.dart';
import 'package:the_exchange_online/utils/translate.dart';
import 'package:flutter/material.dart';

class UtilDialog {
  ///Confirm Dialog
  static Future<String?> showVerification(
    BuildContext context, {
    String? route,
  }) {
    return showGeneralDialog<String>(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: COLOR_CONST.darkColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return VerificationDialog(route: route);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * animation.value,
            sigmaY: 4 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  ///Sign Up Dialog
  static Future<String?> showSignUp(
    BuildContext context,
  ) {
    return showGeneralDialog<String>(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: COLOR_CONST.darkColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SignUpDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * animation.value,
            sigmaY: 4 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  ///Sign In Dialog
  static Future<String?> showSignIn(
    BuildContext context
  ) {
    return showGeneralDialog<String>(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: COLOR_CONST.darkColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SignInDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * animation.value,
            sigmaY: 4 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  static showInformation(
    BuildContext context, {
    String? title,
    String? content,
    Function()? onClose,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: COLOR_CONST.darkColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          content: Text(
            content!,
            style: FONT_CONST.REGULAR_DEFAULT_16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onClose ?? () => Navigator.of(context).pop(),
              child: Text(
                Translate.of(context).translate("close"),
                style: FONT_CONST.REGULAR_DEFAULT_18,
              ),
            )
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * animation.value,
            sigmaY: 4 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  static showWaiting(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: COLOR_CONST.darkColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return const Loading();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * animation.value,
            sigmaY: 4 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  static hideWaiting(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<bool?> showConfirmation(
    BuildContext context, {
    String? title,
    required Widget content,
    String confirmButtonText = "Yes",
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: COLOR_CONST.darkColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          title: Text(
            title ?? Translate.of(context).translate("message_for_you"),
            style: FONT_CONST.MEDIUM_PRIMARY_20,
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              child: Text(
                Translate.of(context).translate("close"),
                style: FONT_CONST.MEDIUM_PRIMARY_14,
              ),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              style: TextButton.styleFrom(
                backgroundColor: COLOR_CONST.primaryColor,
              ),
              child: Text(
                confirmButtonText,
                style: FONT_CONST.REGULAR_WHITE_16,
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * animation.value,
            sigmaY: 4 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}
