import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class SignIn extends AuthenticationEvent {
  final String route;

  SignIn(this.route);

  @override
  List<Object> get props => [route];
}

class SignOut extends AuthenticationEvent {}
