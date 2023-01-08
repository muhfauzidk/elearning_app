import 'dart:async';

import 'package:elearning_app/views/login_page.dart';
import 'package:elearning_app/views/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constans/r.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          //TODO: redirect to register or home
          Navigator.of(context).pushReplacementNamed(MainPage.route);
        } else {
          Navigator.of(context).pushReplacementNamed(LoginPage.route);
        }
      },
    );

    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(R.assets.icSplash),
      ),
    );
  }
}
