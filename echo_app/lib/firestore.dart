import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:echo_app/pages/splash.dart';
class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();

  static void deleteUser() {}

  static Future<void> deleteCurrentUser(BuildContext context) async {
    CollectionReference usersdb =
        FirebaseFirestore.instance.collection('User');
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
  CollectionReference usersdb =
      FirebaseFirestore.instance.collection('User');
  late User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: usersdb.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          //if(streamSnapshot.hasData){
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
            },
          );
          //}
        },
      ),
    );
  }
}
