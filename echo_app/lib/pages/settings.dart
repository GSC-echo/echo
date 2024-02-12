import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/config/colors.dart';
import 'package:echo_app/firestore.dart';
import 'package:echo_app/main.dart';
import 'package:echo_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('lib/config/images/echo.png', width: 150, height: 150),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  border: Border.all(
                      color: BackgroundColor.mainGreen.withOpacity(0.70),
                      width: 3),
                ),
                height: 350,
                width: 350,
                child: Container(
                  //margin: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
      //Record
                      Container(
                        width: 350,
                        height: 75,
                        child: InkWell(
                          onTap: () {
                            //signInWithGoogle(context);
                          },
                          child: Card(
                            color: BackgroundColor.mainGreen.withOpacity(0.75),
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Center(
                              child: Text(
                                "RECORD",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
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
                        width: 350,
                        height: 75,
                        child: InkWell(
                          onTap: () {
                            print("signout");
                             FireStorePage.deleteCurrentUser(context);
                          },
                          child: Card(
                            color: BackgroundColor.mainGreen.withOpacity(0.75),
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Center(
                              child: Text(
                                "SIGN OUT",
                                textAlign: TextAlign.center, 
                                style: TextStyle(
                                  color: Colors.white,
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
                        width: 350,
                        height: 75,
                        child: InkWell(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Card(
                            color: BackgroundColor.mainGreen.withOpacity(0.75),
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Center(
                              child: Text(
                                "Privacy & Security",
                                textAlign: TextAlign.center, 
                                style: TextStyle(
                                  color: Colors.white,
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
                        width: 350,
                        height: 75,
                        child: InkWell(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Card(
                            color: BackgroundColor.mainGreen.withOpacity(0.75),
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Center(
                              child: Text(
                                "Help & Support",
                                textAlign: TextAlign.center, 
                                style: TextStyle(
                                  color: Colors.white,
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
            Container(
              width: 250,
              height: 75,
              child: InkWell(
                onTap: () async{
                  GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
                },
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                    side: BorderSide(color: const Color.fromARGB(255, 237, 104, 94), width:3)
                  ),
                  elevation: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                                    Icons.logout,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Log out", 
                            style: TextStyle(
                                color:const Color.fromARGB(255, 237, 104, 94),
                                fontFamily: 'Not oSansKR',
                                fontWeight: FontWeight.bold,
                                fontSize: 18))
                      ]),
                ))
            ),
          ],
        ),
      ),
    );
  }
}

