import 'package:expiret/view/screens/home_screen.dart';
import 'package:expiret/view/screens/products_history_screen.dart';
import 'package:expiret/view/screens/settings_screen.dart';
import 'package:expiret/view/screens/sign_in_screen.dart';
import 'package:expiret/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'sign_in': (context) => const SignInScreen(),
  'sign_up': (context) => const SignUpScreen(),
  'home': (context) => const HomeScreen(),
  'settings': (context) => const SettingsScreen(),
  'history': (context) => const ProductsScreen(),
};
