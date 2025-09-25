import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/user_model.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class PhoneChanged extends SignUpEvent {
  final String phoneNumber;

  const PhoneChanged({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() {
    return 'PhoneChange{phoneNumber: $phoneNumber}';
  }
}

class NameChanged extends SignUpEvent {
  final String name;

  const NameChanged({required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() {
    return 'NameChange{name: $name}';
  }
}

/// When user changes email
class EmailChanged extends SignUpEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}

class HandleChanged extends SignUpEvent {
  final String handle;

  const HandleChanged({required this.handle});

  @override
  List<Object> get props => [handle];

  @override
  String toString() {
    return 'HandleChanged{handle: $handle}';
  }
}

/// When user changes password
class PasswordChanged extends SignUpEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';
  }
}

/// When user changes confirmed password
class ConfirmPasswordChanged extends SignUpEvent {
  final String password;
  final String confirmPassword;

  const ConfirmPasswordChanged(
      {required this.password, required this.confirmPassword});

  @override
  String toString() {
    return 'ConfirmPasswordChanged{password: $password ,confirmPassword: $confirmPassword}';
  }
}

/// When clicks to register button
class SignUp extends SignUpEvent {
  final UserModel user; // contains new user's information
  final String password;
  final String confirmPassword;
  final bool offers;

  const SignUp({
    required this.user,
    required this.password,
    required this.confirmPassword,
    required this.offers,
  });

  @override
  List<Object> get props => [user, password, offers];

  @override
  String toString() {
    return 'Submitted{name: ${user.firstName}, phoneNumber: ${user.phoneNumber}, email: ${user.email}, password: $password, confirmPassword: $confirmPassword, offers: $offers}';
  }
}
