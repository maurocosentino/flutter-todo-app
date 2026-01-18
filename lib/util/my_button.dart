import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onPressed});
  VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: BorderDirectional(
        start: BorderSide(color: Colors.black, width: 3.5),
        end: BorderSide(color: Colors.black),
        top: BorderSide(color: Colors.black),
        bottom: BorderSide(color: Colors.black, width: 2.5),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
