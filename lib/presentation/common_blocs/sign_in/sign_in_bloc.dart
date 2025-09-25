import 'package:the_exchange_online/data/repository/repository.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_in/sign_in_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_in/sign_in_state.dart';
import 'package:the_exchange_online/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository = AppRepository.authRepository;
  // CameraPosition? position;

  SignInBloc() : super(SignInState.empty()) {
    on<SignInEvent>((event, emit) {
      transformEvents(const Duration(milliseconds: 300));
    });
    on<SignInUser>((event, emit) async {
      await _mapSignInToState(event, emit);
    });
    on<EmailChanged>((event, emit) async {
      await _mapEmailChangedToState(event, emit);
    });
    on<PasswordChanged>((event, emit) async {
      await _mapPasswordChangedToState(event, emit);
    });
  }

  EventTransformer<SignInEvent> transformEvents(Duration duration) {
    return (Stream<SignInEvent> events, mapper) {
      final debounceStream = events
          .where((event) => event is EmailChanged || event is PasswordChanged)
          .debounceTime(const Duration(milliseconds: 100));

      final nonDebounceStream = events.where(
          (event) => (event is! EmailChanged || event is! PasswordChanged));

      return MergeStream([
        debounceStream,
        nonDebounceStream,
      ]).switchMap(mapper);
    };
  }

  /// Map from email changed event => states
  Future<void> _mapEmailChangedToState(event, Emitter<SignInState> emit) async {
    emit(state.update(isEmailValid: UtilValidators.isValidEmail(event.email)));
  }

  /// Map from  password changed event => states
  Future<void> _mapPasswordChangedToState(
      event, Emitter<SignInState> emit) async {
    String password = event.password;
    emit(state.update(
        isPasswordValid: UtilValidators.isValidPassword(password)));
  }

  Future<void> _mapSignInToState(event, Emitter<SignInState> emit) async {
    String email = event.email;
    String password = event.password;
    emit(SignInState.logging());

    try {
      await _authRepository.signInUser(email, password);
      bool isSignedIn = _authRepository.isSignedIn();
      if (isSignedIn) {
        if (_authRepository.isVerified()) {
          emit(SignInState.success("verified"));
        } else {
          emit(SignInState.success("verify_email"));
        }
      } else {
        final message = _authRepository.authException;
        emit(SignInState.failure(message));
      }
    } catch (error) {
      emit(SignInState.failure(error.toString()));
    }
  }
}
