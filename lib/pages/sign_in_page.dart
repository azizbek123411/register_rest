import 'package:flutter/material.dart';
import 'package:register_rest/models/user_model.dart';
import 'package:register_rest/pages/home_page.dart';
import 'package:register_rest/pages/sign_up_page.dart';
import 'package:register_rest/service/api_service.dart';
import 'package:register_rest/service/navogator_service.dart';
import 'package:register_rest/service/strorage_service.dart';

import '../widgets/buttons.dart';
import '../widgets/sizedbox.dart';
import '../widgets/textfields.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'signin';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    UserModel user = UserModel(
      password: passwordController.text.trim(),
      username: usernameController.text.trim(),
    );
    final response = await ApiService.loginUser(user);
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
                'Sign In',
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
                title: 'Enter password',
              ),
              Hbox(25),
              Buttons(
                title: 'Sign in',
                onPressed: login,
              ),
              Hbox(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not account?"),
                  TextButton(onPressed: (){
                    navigateID(SignUpPage.id, context);
                  }, child:const Text('Register'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
