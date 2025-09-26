// ignore_for_file: constant_identifier_names

import 'package:the_exchange_online/presentation/screens/add_product/add_product_screen.dart';
import 'package:the_exchange_online/presentation/screens/center/center_screen.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/shop_screen.dart';
import 'package:the_exchange_online/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  static const String SPLASH = '/splash';
  static const String SIGN_IN = '/login';
  static const String INITIALIZE_INFO = '/initialize_info';
  static const String REGISTER = '/register';
  static const String CENTER = '/center';
  static const String CREATE_SHOP = '/create_shop';
  static const String MY_SHOP = '/my_shop';
  static const String ADD_PRODUCT = '/add_product';
  static const String PROFILE = '/profile';
  static const String VERIFY_USER = '/verify_user';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Home
      case SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case CENTER:
        return MaterialPageRoute(builder: (_) => const CenterScreen());
      case CREATE_SHOP:
        // return MaterialPageRoute(builder: (_) => const CreateShopScreen());
      case MY_SHOP:
        return MaterialPageRoute(builder: (_) => const ShopScreen());
      case ADD_PRODUCT:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
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
