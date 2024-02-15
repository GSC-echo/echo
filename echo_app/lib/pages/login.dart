import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:echo_app/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Image.asset('lib/config/images/echo.png', width: 300, height: 300),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  height: 300,
                  width: 350,
                  child: Container(
                    child: Column(
                      children: [
                        const Text(
                          "Welcome to echo!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Jua',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F1A20),
                          ),
                        ),
                        const Text(
                          "\nLet's go on a meaningful journey together from now on!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Jua',
                            fontSize: 25,
                            color: Color(0xFF0F1A20),
                          ),
                        ),
                        //LOGIN
                        SizedBox(
                          width: 350,
                          height: 90,
                          child: InkWell(
                            onTap: () {
                              signInWithGoogle(context);
                            },
                            child: Card(
                              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                              color:Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: Color(0xFF0F1A20), width: 2),
                              ),
                              elevation: 3,
                              child: const Center(
                                child: Text(
                                  "CONTINUE WITH GOOGLE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0F1A20),
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
                margin: const EdgeInsets.only(bottom: 10.0),
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
      builder: (context) => const MyApp(), 
    ));
  } catch (e) {
    print("Error signing in with Google: $e");
    Navigator.of(context).pop(); 
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to sign in with Google')),
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
      'points':0,
    });

    print('first sign in: ${googleUser.uid}');
  }
  else {
    return;
  }
}