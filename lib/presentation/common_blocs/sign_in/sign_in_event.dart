import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

/// When user changes email
class EmailChanged extends SignInEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}

/// When user changes password
class PasswordChanged extends SignInEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';
  }
}

/// When user clicks to login button
class SignInUser extends SignInEvent {
  final String email;
  final String password;

  const SignInUser({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
