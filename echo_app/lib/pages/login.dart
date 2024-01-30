import 'package:echo_app/config/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:echo_app/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('lib/config/images/echo.png', width: 200, height: 200),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: BackgroundColor.mainGreen.withOpacity(0.85),
                ),
                height: 400,
                width: 350,
                child: Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to echo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        "\nLet's go on a meaningful journey together from now on!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
      //LOGIN 
                      Container(
                        width: 200,
                        height: 70,
                        child: InkWell(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Card(
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: BackgroundColor.mainGreen, width: 2),
                            ),
                            elevation: 3,
                            child: Center(
                              // 중앙 정렬을 위한 Center 위젯 추가
                              child: Text(
                                "LOG IN",
                                textAlign: TextAlign.center, // 텍스트 가운데 정렬
                                style: TextStyle(
                                  color: BackgroundColor.mainGreen,
                                  fontFamily: 'Jua',
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
      //SIGN IN
                       Container(
                        width: 200,
                        height: 70,
                        child: InkWell(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Card(
                            color: BackgroundColor.mainGreen.withOpacity(0.70),
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                            elevation: 3,
                            child: Center(
                              // 중앙 정렬을 위한 Center 위젯 추가
                              child: Text(
                                "SIGN UP",
                                textAlign: TextAlign.center, // 텍스트 가운데 정렬
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Jua',
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Text(
                        "\nAll signup and login are made with Google accounts.\nBy continuing, you agree to \nEcho’s Terms of Use and Privacy Policy.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
    print(value.user?.email);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MyApp(),
    ));
  }).onError((error, stackTrace) {
    print("error $error");
  });
}
