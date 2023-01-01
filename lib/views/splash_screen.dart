import 'dart:async';

import 'package:elearning_app/views/login_page.dart';
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
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        // );
        Navigator.of(context).pushNamed(LoginPage.route);
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
