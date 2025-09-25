import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/application.dart';
import 'package:the_exchange_online/data/local/pref.dart';
import 'package:the_exchange_online/presentation/common_blocs/application/application_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/application/application_state.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/common_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/language/language_event.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final Application application = Application();

  ApplicationBloc() : super(ApplicationInitial()) {
    on<SetupApplicationEvent>(_onSetupApplication);
  }

  Future<void> _onSetupApplication(
      SetupApplicationEvent event, Emitter<ApplicationState> emit) async {
    try {
      await application.setPreferences();

      final oldLanguage = LocalPref.getString("language");

      if (oldLanguage != null) {
        CommonBloc.languageBloc.add(LanguageChanged(Locale(oldLanguage)));
      }

      CommonBloc.authenticationBloc.add(AuthenticationStarted());

      debugPrint("Authentication Check Done");
      emit(ApplicationCompleted());
    } catch (error) {
      emit(ApplicationError());
    }
  }
}
