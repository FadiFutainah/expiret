import 'package:expiret/view/widgets/sign_up_form.dart';
import 'package:expiret/view_models/blocs/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: _height * 0.9,
          width: _width * 0.95,
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 2.0,
              child: BlocProvider(
                create: (context) => SignUpBloc(),
                child: const SignUpForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
