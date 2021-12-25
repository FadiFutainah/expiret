import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PasswordChanged extends SignUpEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends SignUpEvent {
  final String confirmPassword;

  ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class EmailChanged extends SignUpEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends SignUpEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class FacebookLinkChanged extends SignUpEvent {
  final String facebookLink;

  FacebookLinkChanged(this.facebookLink);

  @override
  List<Object?> get props => [facebookLink];
}

class EmailUnfocused extends SignUpEvent {}

class PasswordUnfocused extends SignUpEvent {}

class PhoneNumberUnfocused extends SignUpEvent {}

class FacebookLinkUnfocused extends SignUpEvent {}

class ConfirmPasswordUnfocused extends SignUpEvent {}

class SignUpPressed extends SignUpEvent {
  final String email;
  final String password;
  final String phoneNumber;
  final String facebookLink;
  final String confirmPassword;

  SignUpPressed(this.email, this.password, this.confirmPassword, this.phoneNumber, this.facebookLink);

  @override
  List<Object> get props => [email, password, confirmPassword, phoneNumber, facebookLink];
}
