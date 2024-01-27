
import 'package:echo_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  signInWithGoogle();
                },
                child: Card(
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  elevation: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/google.png',width:50,height:50),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Sign In With Google", 
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

  Future<Null> signInWithGoogle() async {
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
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value){
      print(value.user?.email);
      Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
        builder: (context) => MyApp(),
      ));

  }).onError((error, stackTrace){
    print("error $error");
  });
  }
}
