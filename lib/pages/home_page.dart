import 'package:flutter/material.dart';
import 'package:register_rest/models/user_model.dart';
import 'package:register_rest/pages/sign_up_page.dart';
import 'package:register_rest/service/navogator_service.dart';
import 'package:register_rest/service/strorage_service.dart';
import 'package:register_rest/widgets/buttons.dart';
import 'package:register_rest/widgets/sizedbox.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout(){
    StorageService.delete();
    navigateID(SignUpPage.id, context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Succesfully registrated',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),Hbox(30),
         Buttons(title: 'Log out', onPressed:logout)
          ],
        ),
      ),
    );
  }
}
