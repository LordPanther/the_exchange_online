import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/presentation/common_blocs/verification/verification_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/verification/verification_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/verification/verification_state.dart';
import 'package:the_exchange_online/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/utils/translate.dart';

class VerificationDialog extends StatefulWidget {
  final String? route;
  const VerificationDialog({super.key, this.route});

  @override
  State<VerificationDialog> createState() => _VerificationDialogState();
}

class _VerificationDialogState extends State<VerificationDialog> {
  @override
  void initState() {
    _verifyEmail();
    super.initState();
  }

  // Code verification
  void _verifyEmail() {
    context.read<VerificationBloc>().add(const SendVerificationEmailEvent());
  }

  void _goHome() {
    Navigator.of(context).pop("verified");
  }

  // Resend verification link
  void _onResendLink() {
    context.read<VerificationBloc>().add(const SendVerificationEmailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationBloc, VerificationState>(
      listener: (context, state) {
        ///Confirming
        if (state.isSubmitting) {
          UtilDialog.showWaiting(context);
        }

        ///Success
        if (state.isSuccess) {
          UtilDialog.hideWaiting(context);
          Navigator.of(context).pop("verified");
        }

        ///Failure
        if (state.isFailure) {
          UtilDialog.hideWaiting(context);
          UtilDialog.showInformation(context, content: state.message);
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
                vertical: SizeConfig.defaultSize * 5,
              ),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Translate.of(context).translate('verification_note'),
                        style: FONT_CONST.MEDIUM_DEFAULT_16,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _resendButton(),
                          _continueButton(),
                        ],
                      )
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

  _continueButton() {
    return TextButton(
      onPressed: _goHome,
      child: Text(
        Translate.of(context).translate('continue'),
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
    );
  }

  _resendButton() {
    return TextButton(
      onPressed: _onResendLink,
      child: Text(
        Translate.of(context).translate('resend_email_link'),
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
    );
  }
}
