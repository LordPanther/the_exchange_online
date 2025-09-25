import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/application/application_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/cart/cart_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/language/language_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/order/order_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_in/sign_in_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_up/sign_up_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/verification/verification_bloc.dart';

class CommonBloc {
  /// Bloc
  static final applicationBloc = ApplicationBloc();
  static final authenticationBloc = AuthenticationBloc();
  static final verificationBloc = VerificationBloc();
  static final signInloc = SignInBloc();
  static final signUpBloc = SignUpBloc();
  static final languageBloc = LanguageBloc();
  static final cartBloc = CartBloc();
  static final orderBloc = OrderBloc();
  // static final storeBloc = ShopBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<AuthenticationBloc>(
      create: (context) => authenticationBloc,
    ),
    BlocProvider<SignInBloc>(
      create: (context) => signInloc,
    ),
    BlocProvider<SignUpBloc>(
      create: (context) => signUpBloc,
    ),
    BlocProvider<VerificationBloc>(
      create: (context) => verificationBloc,
    ),
    BlocProvider<LanguageBloc>(
      create: (context) => languageBloc,
    ),
    BlocProvider<CartBloc>(
      create: (context) => cartBloc,
    ),
    BlocProvider<OrderBloc>(
      create: (context) => orderBloc,
    ),
    // BlocProvider<ShopBloc>(
    //   create: (context) => storeBloc,
    // ),
  ];

  /// Dispose
  static void dispose() {
    applicationBloc.close();
    authenticationBloc.close();
    signInloc.close();
    signUpBloc.close();
    languageBloc.close();
    cartBloc.close();
  }

  /// Singleton factory
  static final CommonBloc _instance = CommonBloc._internal();

  factory CommonBloc() {
    return _instance;
  }
  CommonBloc._internal();
}
