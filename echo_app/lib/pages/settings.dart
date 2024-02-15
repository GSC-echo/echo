import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/config/colors.dart';
import 'package:echo_app/firestore.dart';
import 'package:echo_app/main.dart';
import 'package:echo_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:echo_app/pages/splash.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor.mainGreen,
        centerTitle: true,
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: BackgroundColor.mainGreen,
          ),
          child: Column(
            children: [
              SizedBox(height: 70.h),
              Image.asset('lib/config/images/echo.png',
                  width: 250, height: 250),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 250,
                  width: 350,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 75,
                          child: InkWell(
                            onTap: () {
                              print("signout");
                              FireStorePage.deleteCurrentUser(context);
                            },
                            child: Card(
                              color: Colors.white,
                              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              elevation: 3,
                              child: Center(
                                child: Text(
                                  "Sign out",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0F1A20),
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: 300,
                          height: 75,
                          child: InkWell(
                            onTap: () {
                              signInWithGoogle(context);
                            },
                            child: Card(
                              color: Colors.white,
                              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              elevation: 3,
                              child: Center(
                                child: Text(
                                  "Help & Support",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0F1A20),
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  width: 200,
                  height: 75,
                  child: InkWell(
                      onTap: () async {
                        GoogleSignIn().signOut();
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context as BuildContext)
                            .pushReplacement(MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                      },
                      child: Card(
                        color: Color(0xFF0F6AE2D),
                        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          //side: BorderSide(color: const Color.fromARGB(255, 237, 104, 94), width:3)
                        ),
                        elevation: 3,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                size: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Log out",
                                  style: TextStyle(
                                      color: Color(0xFF0F1A20),
                                      fontFamily: 'Not oSansKR',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ]),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
