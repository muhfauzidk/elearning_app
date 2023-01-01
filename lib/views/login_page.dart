import 'package:elearning_app/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constans/r.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String route = "login_screen";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  R.strings.login,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(R.assets.imgLogin),
            SizedBox(height: 35),
            Text(
              R.strings.welcome,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              R.strings.loginDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: R.colors.greySubtitles,
              ),
            ),
            Spacer(),
            ButtonLogin(
              onTap: () {
                Navigator.of(context).pushNamed(RegisterPage.route);
              },
              backgroundColor: Colors.white,
              borderColor: R.colors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(R.assets.icGoogle),
                  SizedBox(width: 12),
                  Text(
                    R.strings.loginWithGoogle,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: R.colors.blackButtonLogin,
                    ),
                  ),
                ],
              ),
            ),
            ButtonLogin(
              onTap: () {},
              backgroundColor: Colors.black,
              borderColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(R.assets.icApple),
                  SizedBox(width: 12),
                  Text(
                    R.strings.loginWithApple,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    required this.backgroundColor,
    required this.child,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget child;
  final Color borderColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(color: borderColor),
            ),
            fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
          ),
          onPressed: onTap,
          child: child),
    );
  }
}
