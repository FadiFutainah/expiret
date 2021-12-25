import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PasswordChanged extends SignInEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class EmailChanged extends SignInEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordUnfocused extends SignInEvent {}

class EmailUnfocused extends SignInEvent {}

class SignInPressed extends SignInEvent {
  final String email;
  final String password;

  SignInPressed(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
