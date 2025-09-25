// ignore_for_file: constant_identifier_names

import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/presentation/screens/center/center_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/splash/splash_screen.dart';

class AppRouter {
  static const String SPLASH = '/splash';
  static const String SIGN_IN = '/login';
  static const String INITIALIZE_INFO = '/initialize_info';
  static const String REGISTER = '/register';
  static const String CENTER = '/center';
  static const String PROFILE = '/profile';
  static const String VERIFY_USER = '/verify_user';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Home
      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case CENTER:
        return MaterialPageRoute(
          builder: (_) => const CenterScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  ///Singleton factory
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal();
}
