import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_event.dart';
import 'package:the_exchange_online/utils/dialog.dart';

class AuthManager {
  final BuildContext context;
  AuthManager(this.context);

  Future<void> signIn(String route) async {
    var result = await UtilDialog.showSignIn(context);
    if (result != null) {
      _handleAuthResult(result, route);
    }
  }

  Future<void> signUp(String route) async {
    var result = await UtilDialog.showSignUp(context);
    if (result != null) {
      _handleAuthResult(result, route);
    }
  }

  void signOut() {
    BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
  }

  void _handleAuthResult(String action, String route) {
    if (action == "verify_email") {
      _verifyEmail(route);
    } else if (action == "verified") {
      _completeSignIn(route);
    }
  }

  void _verifyEmail(String route) async {
    var action = await UtilDialog.showVerification(context);
    if (action != null) {
      _handleAuthResult(action, route);
    }
  }

  void _completeSignIn(String route) {
    BlocProvider.of<AuthenticationBloc>(context).add(SignIn(route));
    Navigator.of(context).pushNamed(route);
  }
}
