import 'package:expiret/config/config.dart';
import 'package:expiret/config/imports/buttons.dart';
import 'package:expiret/models/settings_info.dart';
import 'package:expiret/services/local_storage.dart';
import 'package:expiret/view/widgets/bottom_nav_bar.dart';
import 'package:expiret/view/widgets/expiret_app_bar.dart';
import 'package:expiret/view/widgets/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExpiretAppBar(title: 'Settings'),
      body: Column(
        children: [
          FutureBuilder<SettingsInfo>(
            future: Storage().settingsInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Settings(
                  username: snapshot.data!.username,
                  password: snapshot.data!.password,
                  phoneNumber: snapshot.data!.phoneNumber,
                  facebookLink: snapshot.data!.facebookLink,
                );
              } else {
                return const Settings.empty();
              }
            },
          ),
          Row(
            children: [
              SubmitButton(
                text: 'CANCEL',
                onPressed: () {},
              ),
              SubmitButton(
                text: 'CANCEL',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(screen: Screen.settings),
    );
  }
}
