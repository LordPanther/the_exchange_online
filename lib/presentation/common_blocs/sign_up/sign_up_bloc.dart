// import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_exchange_online/data/models/user_model.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
// import 'package:the_exchange_online/data/repository/user_repository/firebase_user_repo.dart';
// import 'package:the_exchange_online/data/repository/user_repository/user_repo.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_up/sign_up_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/sign_up/sign_up_state.dart';
import 'package:the_exchange_online/utils/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository = AppRepository.authRepository;
  // final UserRepository _userRepository = FirebaseUserRepository();

  SignUpBloc() : super(SignUpState.empty()) {
    on<SignUpEvent>((event, emit) {
      transformEvents(const Duration(milliseconds: 900));
    });
    on<NameChanged>((event, emit) async {
      await _mapNameChangedToState(event, emit);
    });
    on<PhoneChanged>((event, emit) async {
      await _mapPhoneChangedToState(event, emit);
    });
    on<EmailChanged>((event, emit) async {
      await _mapEmailChangedToState(event, emit);
    });
    on<HandleChanged>((event, emit) async {
      await _mapHandleChangedToState(event, emit);
    });
    on<PasswordChanged>((event, emit) async {
      await _mapPasswordChangedToState(event, emit);
    });
    on<ConfirmPasswordChanged>((event, emit) async {
      await _mapConfirmPasswordChangedToState(event, emit);
    });
    on<SignUp>((event, emit) async {
      await _mapFormSubmittedToState(event, emit);
    });
  }

  EventTransformer<SignUpEvent> transformEvents(Duration duration) {
    return (Stream<SignUpEvent> events, mapper) {
      var debounceStream = events
          .where((event) =>
              event is NameChanged ||
              event is PhoneChanged ||
              event is EmailChanged ||
              event is HandleChanged ||
              event is PasswordChanged ||
              event is ConfirmPasswordChanged)
          .debounceTime(const Duration(milliseconds: 300));
      var nonDebounceStream = events.where((event) =>
          event is! NameChanged &&
          event is! PhoneChanged &&
          event is! EmailChanged &&
          event is! HandleChanged &&
          event is! PasswordChanged &&
          event is! ConfirmPasswordChanged);
      return MergeStream([nonDebounceStream, debounceStream]).switchMap(mapper);
    };
  }

  Future<void> _mapNameChangedToState(event, Emitter<SignUpState> emit) async {
    String name = event.name;
    emit(state.update(
      isNameValid: UtilValidators.isValidName(name),
    ));
  }

  Future<void> _mapPhoneChangedToState(event, Emitter<SignUpState> emit) async {
    String phone = event.phoneNumber;
    emit(state.update(
      isPhoneValid: UtilValidators.isValidPhoneNumber(phone),
    ));
  }

  /// Map from email changed event => states
  Future<void> _mapEmailChangedToState(event, Emitter<SignUpState> emit) async {
    String email = event.email;
    emit(state.update(
      isEmailValid: UtilValidators.isValidEmail(email),
    ));
  }

  Future<void> _mapHandleChangedToState(event, Emitter<SignUpState> emit) async {
    String handle = event.handle;
    emit(state.update(
      isHandleValid: UtilValidators.isValidHandle(handle),
    ));
  }

  /// Map from password changed event => states
  Future<void> _mapPasswordChangedToState(
      event, Emitter<SignUpState> emit) async {
    String password = event.password;
    var isPasswordValid = UtilValidators.isValidPassword(password);

    emit(state.update(isPasswordValid: isPasswordValid));
  }

  /// Map from confirmed password changed event => states
  Future<void> _mapConfirmPasswordChangedToState(
      event, Emitter<SignUpState> emit) async {
    String password = event.password;
    String confirm = event.confirmPassword;
    var isConfirmPasswordValid = UtilValidators.isValidPassword(confirm);
    var isMatched = true;

    if (confirm.isNotEmpty) {
      isMatched = password == confirm;
    }

    emit(state.update(
      isConfirmPasswordValid: isConfirmPasswordValid && isMatched,
    ));
  }

  /// Map from submit event => states
  Future<void> _mapFormSubmittedToState(
      event, Emitter<SignUpState> emit) async {
    UserModel newUser = event.user;
    String password = event.password;
    try {
      emit(SignUpState.loading());
      await _authRepository.signUpUser(newUser, password);

      bool isLoggedIn = _authRepository.isSignedIn();
      if (isLoggedIn) {
        emit(SignUpState.success());
      } else {
        final message = _authRepository.authException;
        // await _authRepository.currentUser.delete();
        // await _userRepository.removeUserData(newUser);
        emit(SignUpState.failure(message));
      }
    } catch (e) {
      final message = _authRepository.authException;
      emit(SignUpState.failure(message));
    }
  }
}
