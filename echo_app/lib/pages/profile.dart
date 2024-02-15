import 'package:echo_app/pages/about_stage.dart';
import 'package:echo_app/pages/home.dart';
import 'package:echo_app/pages/record.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:echo_app/config/colors.dart';
import 'package:echo_app/pages/settings.dart' as EchoAppSettings;
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:echo_app/firestore.dart' as fs;
import 'package:percent_indicator/linear_percent_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  User? _user;
  bool _isEditing = false;
  String _nationality = '';
  final String _editedNationality = '';
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Map<String, dynamic> getUserStage(int p) {
    if (p < 50) {
      return {"stage": "Sprout IV", "upperBound": 50};
    } else if (p < 100) {
      return {"stage": "Sprout III", "upperBound": 100};
    } else if (p < 150) {
      return {"stage": "Sprout II", "upperBound": 150};
    } else if (p < 200) {
      return {"stage": "Sprout I", "upperBound": 200};
    } else if (p < 250) {
      return {"stage": "Seedling IV", "upperBound": 250};
    } else if (p < 300) {
      return {"stage": "Seedling III", "upperBound": 300};
    } else if (p < 350) {
      return {"stage": "Seedling II", "upperBound": 350};
    } else if (p < 400) {
      return {"stage": "Seedling I", "upperBound": 400};
    } else if (p < 500) {
      return {"stage": "Tree IV", "upperBound": 500};
    } else if (p < 600) {
      return {"stage": "Tree III", "upperBound": 600};
    } else if (p < 700) {
      return {"stage": "Tree II", "upperBound": 700};
    } else if (p < 800) {
      return {"stage": "Tree I", "upperBound": 800};
    } else if (p < 1000) {
      return {"stage": "Forest IV", "upperBound": 1000};
    } else if (p < 1200) {
      return {"stage": "Forest III", "upperBound": 1200};
    } else if (p < 1400) {
      return {"stage": "Forest II", "upperBound": 1400};
    } else {
      return {"stage": "Forest I", "upperBound": 0};
    }
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

  final double _containerHeight = 600.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff0f6ae2d),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     // border: Border.all(
                      //     //   color: Colors.white,
                      //     //   width: 3,
                      //     // ),
                      //   ),
                      //   child: CircleAvatar(
                      //     radius: 100,
                      //     backgroundImage: AssetImage(
                      //         'lib/config/images/sleeping_cat.jpg'),
                      //   ),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(80),
                        ),
                        height: 370.h,
                        child: Column(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 25.h,),
                                  Container(
                                      child: const Icon(Icons.forest,
                                          size: 100,
                                          color: Color.fromARGB(
                                              255, 79, 171, 99))),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 350,
                                          height: 45,
                                          child: Container(
                                            margin: const EdgeInsets.all(0),
                                            child: Center(
                                              child: Text(
                                                _user?.displayName ??
                                                    'Loading...',
                                                textAlign: TextAlign.center,
                                                style: TextStyles.h3.copyWith(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //   margin: EdgeInsets.all(0),
                                        //   width: 60,
                                        //   child: Text(
                                        //     'Email',
                                        //     style: TextStyles.white1.copyWith(fontSize: 16),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: 250,
                                          height: 40,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                _user?.email ?? 'Loading...',
                                                textAlign: TextAlign.center,
                                                style: TextStyles.h3.copyWith(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        getUserStage(
                                            fs.userPoint)["stage"], //user.stage
                                        textAlign: TextAlign.center,
                                        style: TextStyles.white1.copyWith(
                                            fontSize: 28.sp,
                                            color: const Color.fromARGB(
                                                255, 79, 171, 99)),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: " (${fs.userPoint}",
                                              style: TextStyles.white1.copyWith(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromARGB(
                                                      255, 79, 171, 99)),
                                            ),
                                            TextSpan(
                                              text: " pts)",
                                              style: TextStyles.white1.copyWith(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromARGB(
                                                      255, 79, 171, 99)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              //Nationality
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              width: 100,
                              child: Text(
                                'Nationality:',
                                style: TextStyles.h3.copyWith(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              //selectCountry
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 40,
                                    child: _isEditing
                                        ? InkWell(
                                            onTap: _openCountryPicker,
                                            child: Container(
                                              margin: const EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color(0xFF0F1A20)
                                                        .withOpacity(
                                                            0.3), // Shadow color
                                                    spreadRadius:
                                                        2, // Spread of the shadow
                                                    blurRadius:
                                                        3, // Blur radius of the shadow
                                                    offset: const Offset(0,
                                                        5), // Offset of the shadow
                                                  ),
                                                ],
                                              ),
                                              child: Card(
                                                margin: const EdgeInsets.all(0),
                                                color: Colors.white,
                                                child: Center(
                                                  child: _selectedCountry !=
                                                          null
                                                      ? Text(
                                                          _selectedCountry!.name,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyles.h3
                                                              .copyWith(
                                                                  fontSize: 28),
                                                        )
                                                      : Text(
                                                          'Select Country >',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyles.h3
                                                              .copyWith(
                                                                  fontSize: 16),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: Text(
                                              _nationality.isNotEmpty
                                                  ? _nationality
                                                  : 'Select Country  >',
                                              textAlign: TextAlign.center,
                                              style: TextStyles.h3
                                                  .copyWith(fontSize: 25),
                                            ),
                                          ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                      Container(
                        //Edit
                        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                                boxShadow: const [],
                              ),
                              child: Card(
                                elevation: 2,
                                margin: const EdgeInsets.all(0),
                                color: const Color.fromARGB(255, 29, 51, 61)
                                    .withOpacity(0.95),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        _isEditing ? Icons.save : Icons.edit,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5.h,
                                      ),
                                      Text(
                                        _isEditing ? 'Save' : 'Edit Profile',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.white1
                                            .copyWith(fontSize: 15),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 150,
                          height: 45,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RecordPage()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                boxShadow: const [],
                              ),
                              child: Card(
                                elevation: 2,
                                margin: const EdgeInsets.all(0),
                                color: const Color.fromARGB(255, 29, 51, 61)
                                    .withOpacity(0.95),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.list,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Record',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NotoSansKR',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 150,
                          height: 45,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EchoAppSettings.Settings()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                boxShadow: const [],
                              ),
                              child: Card(
                                elevation: 2,
                                margin: const EdgeInsets.all(0),
                                color: const Color.fromARGB(255, 29, 51, 61)
                                    .withOpacity(0.95),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Settings',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NotoSansKR',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
