import 'package:flutter/material.dart';

@immutable
class SignInState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String? message;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const SignInState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    this.message,
  });

  factory SignInState.empty() {
    return const SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  factory SignInState.logging() {
    return const SignInState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: "Logging ...");
  }

  factory SignInState.failure(String message) {
    return SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSuccess: false,
      isSubmitting: false,
      isFailure: true,
      message: message,
    );
  }

  factory SignInState.success([String? success]) {
    return SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      message: success,
    );
  }

  SignInState update({bool? isEmailValid, bool? isPasswordValid}) {
    return cloneWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  SignInState cloneWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? message,
  }) {
    return SignInState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'LoginState{isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
}
