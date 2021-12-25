import 'package:equatable/equatable.dart';
import 'package:expiret/models/form_models/form_models.dart';
import 'package:formz/formz.dart';

class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final PhoneNumber phoneNumber;
  final FacebookLink facebookLink;
  final FormzStatus status;

  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(''),
    this.phoneNumber = const PhoneNumber.pure(),
    this.facebookLink = const FacebookLink.pure(),
    this.status = FormzStatus.pure,
  });

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    PhoneNumber? phoneNumber,
    FacebookLink? facebookLink,
    FormzStatus? status,
  }) => SignUpState(
    email: email ?? this.email,
    status: status ?? this.status,
    password: password ?? this.password,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    facebookLink: facebookLink ?? this.facebookLink,
    confirmPassword: confirmPassword ?? this.confirmPassword,
  );

  @override
  List<Object?> get props =>
      [email, password, confirmPassword, phoneNumber, facebookLink];
}
