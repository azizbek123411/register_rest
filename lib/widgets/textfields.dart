import 'package:flutter/material.dart';

class Textfileds extends StatelessWidget {
  TextEditingController controller;
  String title;

  Textfileds({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
