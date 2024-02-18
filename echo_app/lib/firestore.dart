import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:echo_app/pages/splash.dart';

int userPoint = 0;
List<List<dynamic>> sitesList = List.empty();

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();

  static Future<void> deleteCurrentUser(BuildContext context) async {
    CollectionReference usersdb = FirebaseFirestore.instance.collection('User');
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await usersdb.doc(currentUser.uid).delete();
        print('User deleted from Firestore: ${currentUser.uid}');

        await FirebaseAuth.instance.signOut();
        print('User logged out');
        GoogleSignIn().signOut();
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Splash(),
        ));
      } else {
        print('No user is currently signed in');
      }
    } catch (e) {
      print('Failed to delete user or log out: $e');
    }
  }

}

class _FireStorePageState extends State<FireStorePage> {
  CollectionReference usersdb = FirebaseFirestore.instance.collection('User');
  late User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: usersdb.doc(currentUser!.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!;
            //final userPoint = userData['points'] ?? 0;
            //String userStage = getUserStage(userPoint);
          }
          return Container();
        },
      ),
    );
  }
}
