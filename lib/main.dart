import 'package:flutter/material.dart';
import 'package:register_rest/pages/checker.dart';
import 'package:register_rest/pages/home_page.dart';
import 'package:register_rest/pages/sign_in_page.dart';
import 'package:register_rest/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Checker(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        SignUpPage.id:(context)=>const SignUpPage(),
        SignInPage.id:(context)=>const SignInPage(),
      },
    );
  }
}


