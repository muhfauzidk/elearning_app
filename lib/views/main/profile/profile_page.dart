import 'package:elearning_app/constans/r.dart';
import 'package:elearning_app/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun Saya"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 28,
              bottom: 60,
              right: 15,
              left: 15,
            ),
            decoration: BoxDecoration(
              color: R.colors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama User",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Nama Sekolah User",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  R.assets.imgUser,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Colors.black.withOpacity(0.25),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 13),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Identitas Diri"),
                SizedBox(height: 15),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitlesHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Nama Lengkap User",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitlesHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Nama Lengkap User",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitlesHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Nama Lengkap User",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitlesHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Nama Lengkap User",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitlesHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Nama Lengkap User",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
