import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expiret/models/form_models/form_models.dart';
import 'package:expiret/view_models/events/sign_up_event.dart';
import 'package:expiret/view_models/states/sign_up_state.dart';
import 'package:formz/formz.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<EmailChanged>(_onEmailChanged);
    on<SignUpPressed>(_onSignInPressed);
    on<EmailUnfocused>(_onEmailUnfocused);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordUnfocused>(_onPasswordUnfocused);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<FacebookLinkChanged>(_onFacebookLinkChanged);
    on<PhoneNumberUnfocused>(_onPhoneNumberUnfocused);
    on<FacebookLinkUnfocused>(_onFacebookLinkUnfocused);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ConfirmPasswordUnfocused>(_onConfirmPasswordUnfocused);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);

    emit(state.copyWith(
      email: email.valid ? email : Email.pure(event.email),
      status: Formz.validate([
        email,
        state.password,
        state.confirmPassword,
        state.facebookLink,
        state.phoneNumber,
      ]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
      status: Formz.validate([
        password,
        state.email,
        state.confirmPassword,
        state.facebookLink,
        state.phoneNumber,
      ])
    ));
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<SignUpState> emit) {
        final confirmPassword = ConfirmPassword.dirty(state.password.value, event.confirmPassword);

    emit(state.copyWith(
      confirmPassword: confirmPassword.valid ? confirmPassword : ConfirmPassword.pure(event.confirmPassword),
      status: Formz.validate([
        confirmPassword,
        state.email,
        state.password,
        state.facebookLink,
        state.phoneNumber,
      ])
    ));
  }

  void _onFacebookLinkChanged(
      FacebookLinkChanged event, Emitter<SignUpState> emit) {
    final facebookLink = FacebookLink.dirty(event.facebookLink);

    emit(state.copyWith(
      facebookLink: facebookLink.valid ? facebookLink : FacebookLink.pure(event.facebookLink),
      status: Formz.validate([
        facebookLink,
        state.email,
        state.confirmPassword,
        state.password,
        state.phoneNumber,
      ])
    ));
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<SignUpState> emit) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);

    emit(state.copyWith(
      phoneNumber: phoneNumber.valid ? phoneNumber : PhoneNumber.pure(phoneNumber.value),
      status: Formz.validate([
        phoneNumber,
        state.email,
        state.confirmPassword,
        state.facebookLink,
        state.password,
      ])
    ));
  }

  void _onEmailUnfocused(
      EmailUnfocused event, Emitter<SignUpState> emit) {
    final email = Email.dirty(state.email.value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
        state.confirmPassword,
        state.facebookLink,
        state.phoneNumber,
      ]),
    )); 
  }

  void _onPasswordUnfocused(
      PasswordUnfocused event, Emitter<SignUpState> emit) {
        final password = Password.dirty(state.password.value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        password,
        state.email,
        state.confirmPassword,
        state.facebookLink,
        state.phoneNumber,
      ])
    ));
      }

  void _onConfirmPasswordUnfocused(
      ConfirmPasswordUnfocused event, Emitter<SignUpState> emit) {
        final confirmPassword = ConfirmPassword.dirty(state.password.value, state.confirmPassword.value);

    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([
        confirmPassword,
        state.email,
        state.password,
        state.facebookLink,
        state.phoneNumber,
      ])
    ));
      }

  void _onFacebookLinkUnfocused(
      FacebookLinkUnfocused event, Emitter<SignUpState> emit) {
        final facebookLink = FacebookLink.dirty(state.facebookLink.value);

    emit(state.copyWith(
      facebookLink: facebookLink,
      status: Formz.validate([
        facebookLink,
        state.email,
        state.confirmPassword,
        state.password,
        state.phoneNumber,
      ])
    ));
      }

  void _onPhoneNumberUnfocused(
      PhoneNumberUnfocused event, Emitter<SignUpState> emit) {
          final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);

    emit(state.copyWith(
      phoneNumber: phoneNumber,
      status: Formz.validate([
        phoneNumber,
        state.email,
        state.confirmPassword,
        state.facebookLink,
        state.password,
      ])
    ));
      }

  FutureOr<void> _onSignInPressed(
      SignUpPressed event, Emitter<SignUpState> emit) {

      }
}
