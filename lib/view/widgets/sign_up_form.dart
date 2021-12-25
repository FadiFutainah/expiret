import 'package:expiret/config/imports/buttons.dart';
import 'package:expiret/view/widgets/input_field.dart';
import 'package:expiret/view_models/blocs/sign_up_bloc.dart';
import 'package:expiret/view_models/events/sign_up_event.dart';
import 'package:expiret/view_models/states/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _facebookLinkFocusNode = FocusNode();
  final _comfirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(PasswordUnfocused());
      }
    });

    _phoneNumberFocusNode.addListener(() {
      if (!_phoneNumberFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(PhoneNumberUnfocused());
      }
    });

    _facebookLinkFocusNode.addListener(() {
      if (!_facebookLinkFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(FacebookLinkUnfocused());
      }
    });

    _comfirmPasswordFocusNode.addListener(() {
      if (!_comfirmPasswordFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(ConfirmPasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _facebookLinkFocusNode.dispose();
    _comfirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return InputField(
                label: 'email',
                initialValue: state.email.value,
                focusNode: _emailFocusNode,
                error: state.email.invalid
                    ? '''A complete, valid email e.g. joe@gmail.com'''
                    : null,
                keyboard: TextInputType.emailAddress,
                onChanged: (value) {
                  context.read<SignUpBloc>().add(EmailChanged(value));
                },
              );
            },
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return InputField(
                label: 'phone number',
                initialValue: state.phoneNumber.value,
                focusNode: _phoneNumberFocusNode,
                error: state.phoneNumber.invalid
                    ? '''invalid phone number'''
                    : null,
                hint: '''''',
                keyboard: TextInputType.phone,
                onChanged: (value) {
                  context.read<SignUpBloc>().add(PhoneNumberChanged(value));
                },
                icon: Icons.dialpad_outlined,
              );
            },
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return InputField(
                label: 'password',
                initialValue: state.password.value,
                focusNode: _passwordFocusNode,
                error: state.password.invalid
                    ? '''Password must be at least 8 characters and contain at least one letter and number'''
                    : null,
                hint: '''''',
                isPassword: true,
                keyboard: TextInputType.visiblePassword,
                onChanged: (value) {
                  context.read<SignUpBloc>().add(PasswordChanged(value));
                },
                icon: Icons.password,
              );
            },
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return InputField(
                label: 'confirm password',
                initialValue: state.confirmPassword.value,
                focusNode: _comfirmPasswordFocusNode,
                error: state.confirmPassword.invalid
                    ? '''confirm password and password didn't match'''
                    : null,
                hint: '''''',
                isPassword: true,
                keyboard: TextInputType.visiblePassword,
                onChanged: (value) {
                  context.read<SignUpBloc>().add(ConfirmPasswordChanged(value));
                },
                icon: Icons.password,
              );
            },
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return InputField(
                label: 'facebook link',
                initialValue: state.facebookLink.value,
                focusNode: _facebookLinkFocusNode,
                error: state.facebookLink.invalid ? '''invalid link''' : null,
                hint: '''''',
                keyboard: TextInputType.text,
                onChanged: (value) {
                  context.read<SignUpBloc>().add(FacebookLinkChanged(value));
                },
                icon: Icons.facebook,
              );
            },
          ),
          Center(
            child: SubmitButton(
              text: 'SIGN UP',
              onPressed: () {
                Navigator.of(context).pushNamed('home');
              },
            ),
          ),
        ],
      ),
    );
  }
}
