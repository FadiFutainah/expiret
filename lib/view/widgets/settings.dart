import 'package:flutter/material.dart';

import 'input_field.dart';

class Settings extends StatelessWidget {
  final String username;
  final String phoneNumber;
  final String password;
  final String facebookLink;

  const Settings({
    Key? key,
    required this.username,
    required this.phoneNumber,
    required this.password,
    required this.facebookLink,
  }) : super(key: key);

  const Settings.empty({
    Key? key,
    this.username = '',
    this.phoneNumber = '',
    this.password = '',
    this.facebookLink = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          label: 'username',
          initialValue: username,
        ),
        InputField(
          label: 'phone number',
          initialValue: phoneNumber,
        ),
        InputField(
          label: 'password',
          initialValue: password,
        ),
        InputField(
          label: 'Facebook link account',
          initialValue: facebookLink,
        ),
      ],
    );
  }
}
