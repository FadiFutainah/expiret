import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  String? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? '') ? null : 'invalid';
  }
}

class Email extends FormzInput<String, String> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  String? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '') ? null : 'invalid';
  }
}

class ConfirmPassword extends FormzInput<String, String> {
  final String password;

  const ConfirmPassword.pure(this.password, [String value = ''])
      : super.pure(value);
  const ConfirmPassword.dirty(this.password, [String value = ''])
      : super.dirty(value);

  @override
  String? validator(String? value) {
    return (password == value) ? null : 'invalid';
  }
}

class PhoneNumber extends FormzInput<String, String> {
  const PhoneNumber.pure([String value = '']) : super.pure(value);
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  static final _phoneNumberRegex = RegExp(r'(?:[+0][1-9])?[0-9]{10,12}$');

  @override
  String? validator(String? value) {
    return _phoneNumberRegex.hasMatch(value ?? '') ? null : 'invalid';
  }
}

class FacebookLink extends FormzInput<String, String> {
  const FacebookLink.pure([String value = '']) : super.pure(value);
  const FacebookLink.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    return (value != '') ? null : 'invalid';
  }
}
