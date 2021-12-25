import 'package:bloc/bloc.dart';
import 'package:expiret/models/form_models/form_models.dart';
import 'package:expiret/view_models/events/sign_in_event.dart';
import 'package:expiret/view_models/states/sign_in_state.dart';
import 'package:formz/formz.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailUnfocused>(_onEmailUnfocused);
    on<PasswordUnfocused>(_onPasswordUnfocused);
    on<SignInPressed>(_onSignInPressed);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignInState> emit) {
    final email = Email.dirty(event.email);

    emit(state.copyWith(
      email: email.valid ? email : Email.pure(event.email),
      status: Formz.validate([
        email,
        state.password,
      ]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignInState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onEmailUnfocused(
    EmailUnfocused event,
    Emitter<SignInState> emit,
  ) {
    final email = Email.dirty(state.email.value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordUnfocused(
    PasswordUnfocused event,
    Emitter<SignInState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  void _onSignInPressed(SignInPressed event, Emitter<SignInState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      email: email,
      password: password,
      status: Formz.validate([email, password]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
