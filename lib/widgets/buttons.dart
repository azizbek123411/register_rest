import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String title;
  void Function() onPressed;

  Buttons({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(

      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
