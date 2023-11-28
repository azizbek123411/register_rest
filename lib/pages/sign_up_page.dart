import 'package:flutter/material.dart';
import 'package:register_rest/models/user_model.dart';
import 'package:register_rest/pages/home_page.dart';
import 'package:register_rest/pages/sign_in_page.dart';
import 'package:register_rest/service/api_service.dart';
import 'package:register_rest/service/navogator_service.dart';
import 'package:register_rest/service/strorage_service.dart';
import 'package:register_rest/widgets/buttons.dart';
import 'package:register_rest/widgets/sizedbox.dart';

import '../widgets/textfields.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signup';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register() async {
    UserModel user = UserModel(
      password: passwordController.text.trim(),
      username: usernameController.text.trim(),
    );
    final response = await ApiService.registerUser(user);
    if (response != null) {
      await StorageService.write(response);
      navigateID(HomePage.id, context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Xatolik!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Hbox(25),
              Textfileds(
                controller: usernameController,
                title: 'Enter username',
              ),
              Hbox(25),
              Textfileds(
                controller: passwordController,
                title: 'Enter username',
              ),
              Hbox(25),
              Buttons(title: 'Submit', onPressed: () {
                register();
              }),
              Hbox(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ?'),
                  TextButton(
                    onPressed:(){
                      navigateID(SignInPage.id, context);
                    } ,
                    child: const Text("Sign in"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
