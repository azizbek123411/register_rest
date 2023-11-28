// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:register_rest/pages/sign_up_page.dart';

import '../service/navogator_service.dart';
import '../service/strorage_service.dart';
import 'home_page.dart';

class Checker extends StatefulWidget {
  const Checker({super.key});

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  void initApp() async {
    final token = await StorageService.read();
    if (token != null) {
      navigateID(HomePage.id, context);
    } else {
      navigateID(SignUpPage.id, context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
