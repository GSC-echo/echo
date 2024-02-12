import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/config/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:echo_app/main.dart';
import 'package:echo_app/firestore.dart';

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
                  borderRadius: BorderRadius.circular(10),
                  color:
                      const Color.fromARGB(255, 93, 214, 119).withOpacity(0.85),
                ),
                height: 280,
                width: 350,
                child: Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to echo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\nLet's go on a meaningful journey together from now on!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      //LOGIN
                      Container(
                        width: 350,
                        height: 90,
                        child: InkWell(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Card(
                            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  color: BackgroundColor.mainGreen, width: 2),
                            ),
                            elevation: 3,
                            child: Center(
                              child: Text(
                                "CONTINUE WITH GOOGLE",
                                textAlign: TextAlign.center,
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Column(
                children: [
                  Image.asset('lib/config/images/google.png',
                      width: 30, height: 30),
                  Text(
                    "\nAll signup and login are made with Google accounts.\nBy continuing, you agree to \nEcho’s Terms of Use and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
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

Future<void> signInWithGoogle(BuildContext context) async {
  /** 
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Stack(
      children: [
        ModalBarrier(
          color: Colors.grey.withOpacity(0.5),
          dismissible: false,
        ),
        Center(
          child: SpinKitSpinningCircle(
            itemBuilder: (context, index) {
              return Center(
                  child: Image.asset(
                'lib/config/images/echo.png',
              ));
            },
          ),
        ),
      ],
    ),
  );
**/
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
/** */
    if (googleUser == null) {
      //Navigator.of(context).pop(); 
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    await firstSignIn(context);

    //Navigator.of(context).pop();

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MyApp(), 
    ));
  } catch (e) {
    print("Error signing in with Google: $e");
    Navigator.of(context).pop(); 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to sign in with Google')),
    );
  }
}



Future<void> firstSignIn(BuildContext context) async {
  CollectionReference usersdb = FirebaseFirestore.instance.collection('User');
  User? googleUser = FirebaseAuth.instance.currentUser;
  final userDoc = await usersdb.doc(googleUser!.uid).get();

  if (!userDoc.exists) {
    String displayName = googleUser.displayName ?? '';
    String email = googleUser.email ?? '';

    await usersdb.doc(googleUser.uid).set({
      'uid': googleUser.uid,
      'nickname': displayName,
      'email': email,
    });

    print('first sign in: ${googleUser.uid}');
  }
  else return;
}