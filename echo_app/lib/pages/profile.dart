import 'package:echo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/settings.dart' as EchoAppSettings;
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  User? _user;
  bool _isEditing = false;
  String _nationality = '';
  String _editedNationality = '';
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch additional user data (e.g., nationality) from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      // check if userData is not null
      Map<String, dynamic>? userData =
          userSnapshot.data() as Map<String, dynamic>?;

      setState(() {
        _user = user;
        _nationality = userData?['nationality'] ?? ''; // Update nationality
      });
    }
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveNationality() {
    // For now, just update the UI
    setState(() {
      _isEditing = false;
      _nationality = _editedNationality.isNotEmpty
          ? _editedNationality
          : (_selectedCountry != null ? _selectedCountry!.name : '');
      // _editedNationality -> update in your database
    });
  }

  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  double _containerHeight = 600.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: _containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Color.fromARGB(225, 93, 202, 117),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('lib/config/images/sleeping_cat.jpg'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(0),
                              width: 60,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Jua',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 50,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black87
                                          .withOpacity(0.3), // Shadow color
                                      spreadRadius: 2, // Spread of the shadow
                                      blurRadius:
                                          3, // Blur radius of the shadow
                                      offset:
                                          Offset(0, 5), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: Card(
                                  margin: EdgeInsets.all(0),
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      _user?.displayName ?? 'Loading...',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromRGBO(42, 91, 53, 80),
                                        fontFamily: 'Jua',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(0),
                              width: 60,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Jua',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 50,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black87
                                          .withOpacity(0.3), // Shadow color
                                      spreadRadius: 2, // Spread of the shadow
                                      blurRadius:
                                          3, // Blur radius of the shadow
                                      offset:
                                          Offset(0, 5), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: Card(
                                  margin: EdgeInsets.all(0),
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      _user?.email ?? 'Loading...',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromRGBO(42, 91, 53, 80),
                                        fontFamily: 'Jua',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(0),
                              width: 100,
                              child: Text(
                                'Nationality',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Jua',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 210,
                              height: 50,
                              child: _isEditing
                                  ? InkWell(
                                      onTap: _openCountryPicker,
                                      child: Container(
                                        margin: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black87.withOpacity(
                                                  0.3), // Shadow color
                                              spreadRadius:
                                                  2, // Spread of the shadow
                                              blurRadius:
                                                  3, // Blur radius of the shadow
                                              offset: const Offset(
                                                  0, 5), // Offset of the shadow
                                            ),
                                          ],
                                        ),
                                        child: Card(
                                          margin: EdgeInsets.all(0),
                                          color: Colors.white,
                                          child: Center(
                                            child: _selectedCountry != null
                                                ? Text(
                                                    '${_selectedCountry!.name}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          42, 91, 53, 80),
                                                      fontFamily: 'Jua',
                                                      fontSize: 18,
                                                    ),
                                                  )
                                                : Text(
                                                    'Select Country >',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          42, 91, 53, 80),
                                                      fontFamily: 'Jua',
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Card(
                                      margin: EdgeInsets.all(0),
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          _nationality.isNotEmpty
                                              ? _nationality
                                              : 'Select Country  >',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(42, 91, 53, 80),
                                            fontFamily: 'Jua',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: SizedBox(
                          width: 150,
                          height: 45,
                          child: InkWell(
                            onTap:
                                _isEditing ? _saveNationality : _startEditing,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87
                                        .withOpacity(0.3), // Shadow color
                                    spreadRadius: 2, // Spread of the shadow
                                    blurRadius: 3, // Blur radius of the shadow
                                    offset:
                                        Offset(0, 5), // Offset of the shadow
                                  ),
                                ],
                              ),
                              child: Card(
                                elevation: 0,
                                margin: EdgeInsets.all(0),
                                color: Color.fromARGB(225, 93, 202, 117),
                                child: Center(
                                  child: Text(
                                    _isEditing ? 'Save' : 'Edit Profile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jua',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 175,
                height: 50,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EchoAppSettings.Settings()));
                  },
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 54, 91, 122),
                        width: 3,
                      ),
                    ),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          size: 25,
                          color: Color.fromARGB(255, 54, 91, 120),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Settings',
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 91, 120),
                              fontFamily: 'Jua',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
