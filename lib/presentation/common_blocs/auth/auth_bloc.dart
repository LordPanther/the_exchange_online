import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository = AppRepository.authRepository;

  AuthenticationBloc() : super(Uninitialized()) {
    on<AuthenticationStarted>((event, emit) async {
      await _mapAppStartedToState(event, emit);
    });
    on<SignIn>((event, emit) async {
      await _mapSignedInToState(event, emit);
    });
    on<SignOut>((event, emit) async {
      await _mapSignedOutToState(emit);
    });
  }

  Future<void> _mapAppStartedToState(
      event, Emitter<AuthenticationState> emit) async {
    try {
      bool isSignedIn = _authRepository.isSignedIn();

      await Future.delayed(const Duration(seconds: 5));

      if (isSignedIn) {
        final loggedFirebaseUser = _authRepository.currentUser;
        emit(Authenticated(loggedFirebaseUser));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      debugPrint("Authentication exception: $e");
      emit(Unauthenticated());
    }
  }

  Future<void> _mapSignedInToState(
      event, Emitter<AuthenticationState> emit) async {
    emit(Authenticated(_authRepository.currentUser));
  }

  Future<void> _mapSignedOutToState(Emitter<AuthenticationState> emit) async {
    emit(Unauthenticated());
    _authRepository.signOut();
  }
}
