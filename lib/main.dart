// import 'package:the_exchange_online/firebase_files/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_exchange_online/app_view.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/firebase_file/firebase_options.dart';
import 'package:the_exchange_online/presentation/common_blocs/common_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CommonBloc.blocProviders,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return const AppView();
            },
          );
        },
      ),
    );
  }
}
