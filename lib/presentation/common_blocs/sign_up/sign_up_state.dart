import 'package:meta/meta.dart';

@immutable
class SignUpState {
  final bool? isNameValid;
  final bool? isPhoneValid;
  final bool? isEmailValid;
  final bool? isHandleValid;
  final bool? isPasswordValid;
  final bool? isConfirmPasswordValid;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;
  final String? message;

  bool get isFormValid =>
      isEmailValid! && isHandleValid! && isPasswordValid! && isConfirmPasswordValid!;

  const SignUpState({
    this.isNameValid,
    this.isPhoneValid,
    this.isEmailValid,
    this.isHandleValid,
    this.isPasswordValid,
    this.isConfirmPasswordValid,
    this.isSubmitting,
    this.isSuccess,
    this.isFailure,
    this.message,
  });

  factory SignUpState.empty() {
    return const SignUpState(
      isNameValid: true,
      isPhoneValid: true,
      isEmailValid: true,
      isHandleValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  factory SignUpState.loading() {
    return const SignUpState(
      isNameValid: true,
      isPhoneValid: true,
      isEmailValid: true,
      isHandleValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      message: "Registering ...",
    );
  }

  factory SignUpState.failure(String message) {
    return SignUpState(
      isNameValid: true,
      isPhoneValid: true,
      isEmailValid: true,
      isHandleValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSuccess: false,
      isSubmitting: false,
      isFailure: true,
      message: message,
    );
  }

  factory SignUpState.success() {
    return const SignUpState(
      isNameValid: true,
      isPhoneValid: true,
      isEmailValid: true,
      isHandleValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      message: "Register success",
    );
  }

  SignUpState update(
      {bool? isNameValid,
      bool? isPhoneValid,
      bool? isEmailValid,
      bool? isHandleValid,
      bool? isPasswordValid,
      bool? isConfirmPasswordValid}) {
    return cloneWith(
      isNameValid: isNameValid,
      isPhoneValid: isPhoneValid,
      isEmailValid: isEmailValid,
      isHandleValid: isHandleValid,
      isPasswordValid: isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  SignUpState cloneWith({
    bool? isPhoneValid,
    bool? isEmailValid,
    bool? isHandleValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isNameValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? message,
  }) {
    return SignUpState(
      isNameValid: isNameValid ?? this.isNameValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isHandleValid: isHandleValid ?? this.isHandleValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'RegisterState{isNameValid: $isNameValid, isPhoneValid: $isPhoneValid, isEmailValid: $isEmailValid, isHandleValid: $isHandleValid, isPasswordValid: $isPasswordValid, isConfirmPasswordValid: $isConfirmPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure}';
  }
}
