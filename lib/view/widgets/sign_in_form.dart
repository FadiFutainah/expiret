import 'package:expiret/config/imports/buttons.dart';
import 'package:expiret/view_models/blocs/sign_in_bloc.dart';
import 'package:expiret/view_models/events/sign_in_event.dart';
import 'package:expiret/view_models/states/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<SignInBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<SignInBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextButton(
                  child: Text(
                    'Sign',
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('sign_up');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'sign in to continue',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(height: 50),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return InputField(
                initialValue: state.email.value,
                focusNode: _emailFocusNode,
                error: state.email.invalid
                    ? '''A complete, valid email e.g. joe@gmail.com'''
                    : null,
                keyboard: TextInputType.emailAddress,
                icon: Icons.email,
                onChanged: (value) {
                  context.read<SignInBloc>().add(EmailChanged(value));
                },
                label: 'email',
              );
            },
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return InputField(
                initialValue: state.password.value,
                focusNode: _passwordFocusNode,
                error: state.password.invalid
                    ? '''Password must be at least 8 characters and contain at least one letter and number'''
                    : null,
                hint: '''''',
                isPassword: true,
                keyboard: TextInputType.visiblePassword,
                onChanged: (value) {
                  context.read<SignInBloc>().add(PasswordChanged(value));
                },
                icon: Icons.password,
                label: 'password',
              );
            },
          ),
          const SizedBox(height: 70),
          Center(
            child: SubmitButton(
              text: 'SIGN IN',
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
