import 'package:flutter/material.dart';

class RoundedEditText extends StatelessWidget {
  final Function onTextChanged;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;

  RoundedEditText(
      {this.hintText,
      @required this.onTextChanged,
      this.obscureText = false,
      @required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      onChanged: (value) {
        onTextChanged(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
