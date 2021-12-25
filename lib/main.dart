import 'package:expiret/config/routes/routes.dart';
import 'package:expiret/config/themes/primary_theme.dart';
import 'package:expiret/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SafeArea(child: SignInScreen()),
      theme: primaryTheme,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
