import 'package:aplopes_app/src/auth/sign_in_screen.dart';
import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplopes App',
      theme: ThemeData(
        primarySwatch: CustomColors.aplopesBasicColor
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
