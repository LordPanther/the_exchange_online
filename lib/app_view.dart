// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_exchange_online/configs/application.dart';
import 'package:the_exchange_online/configs/language.dart';
import 'package:the_exchange_online/configs/router.dart';
import 'package:the_exchange_online/configs/theme.dart';
import 'package:the_exchange_online/presentation/common_blocs/application/application_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/application/application_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/application/application_state.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_state.dart';
import 'package:the_exchange_online/presentation/common_blocs/cart/cart_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/cart/cart_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/common_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/language/language_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/language/language_state.dart';
import 'package:the_exchange_online/utils/translate.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    CommonBloc.applicationBloc.add(SetupApplicationEvent());
    super.initState();
  }

  @override
  void dispose() {
    CommonBloc.dispose();
    super.dispose();
  }

  void onNavigate(String route) {
    _navigator!.pushNamedAndRemoveUntil(route, (route) => false);
  }

  // void loadUserData() {
  //   BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  //   BlocProvider.of<CartBloc>(context).add(LoadCart());
  //   BlocProvider.of<ShopBloc>(context).add(LoadShop());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, applicationState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: Application.debug,
              title: Application.title,
              theme: AppTheme.currentTheme,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRouter.SPLASH,
              locale: AppLanguage.defaultLanguage,
              supportedLocales: AppLanguage.supportLanguage,
              localizationsDelegates: const [
                Translate.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                return BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, authState) {
                    if (applicationState is ApplicationCompleted) {
                      if (authState is Unauthenticated) {
                        onNavigate(AppRouter.CENTER);
                      } else if (authState is Uninitialized) {
                        onNavigate(AppRouter.SPLASH);
                      } else if (authState is Authenticated) {
                        // loadUserData();
                        onNavigate(AppRouter.CENTER);
                      }
                    } else {
                      onNavigate(AppRouter.SPLASH);
                    }
                  },
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }
}
