import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SubmitButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        width: 270,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
