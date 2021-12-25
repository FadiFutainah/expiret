import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool isPassword;
  final String initialValue;
  final TextInputType keyboard;
  final String hint;
  final String? label;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  final String? error;
  final IconData? icon;

  const InputField({
    Key? key,
    this.icon,
    this.error,
    this.label,
    this.onChanged,
    this.focusNode,
    this.hint = '',
    this.isPassword = false,
    this.keyboard = TextInputType.text,
    this.initialValue = '',
  }) : super(key: key);
  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? '',
            style: Theme.of(context).textTheme.headline5,
          ),
          TextFormField(
            initialValue: widget.initialValue,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboard,
            obscureText: widget.isPassword,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorText: widget.error,
              suffixIcon: Icon(widget.icon),
              helperText: widget.hint,
              helperMaxLines: 2,
              errorMaxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
