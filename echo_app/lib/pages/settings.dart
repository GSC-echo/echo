
import 'package:echo_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
                    builder: (context) => Splash(),
      ));
                },
                child: Card(
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  elevation: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/config/images/google.png',width:50,height:50),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Log out", 
                            style: TextStyle(
                                color: Color.fromARGB(255, 13, 8, 8),
                                fontFamily: 'Roboto',
                                fontSize: 22,
                                fontWeight: FontWeight.bold))
                      ]),
                ))
          ],
        ))
      ]),
    ));
  }


}
