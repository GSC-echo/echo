import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_app/config/colors.dart';
import 'package:echo_app/firestore.dart';
import 'package:echo_app/main.dart';
import 'package:echo_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(
        backgroundColor: TextStyles.echoNavy.withOpacity(0.95),
        centerTitle: true,
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: BackgroundColor.background1,
          ),
        ),
        iconTheme: IconThemeData(color: BackgroundColor.background1),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: TextStyles.echoNavy.withOpacity(0.95),
          ),
          child: Column(
            children: [
              SizedBox(height: 70.h),
              Image.asset('lib/config/images/echo.png',
                  width: 250, height: 250),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 250,
                  width: 350,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 200,
                            height: 45,
                            child: InkWell(
                              onTap: () {
                                FireStorePage.deleteCurrentUser(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  boxShadow: [],
                                ),
                                child: Card(
                                  elevation: 2,
                                  margin: EdgeInsets.all(0),
                                  color: Color.fromARGB(255, 29, 51, 61)
                                      .withOpacity(0.95),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.outbox,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Sign out',
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
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 200,
                            height: 45,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        backgroundColor: TextStyles.echoNavy,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        contentPadding: EdgeInsets.zero,
                                        content: Container(
                                          width: 360.w,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                          child: Center(
                                            child: Column(children: [
                                              SizedBox(height: 30.h),
                                              Text("Team Echo",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles.white1
                                                      .copyWith(
                                                          fontSize: 30.sp)),
                                              Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 17,
                                                      vertical: 20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.sp),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.w,
                                                                top: 20.h,
                                                                right: 40.w),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.w),
                                                                  child: Text(
                                                                    "scy0723123@gmail.com",
                                                                    style: TextStyles
                                                                        .white1
                                                                        .copyWith(
                                                                            fontSize:
                                                                                15.sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  )),
                                                            ]),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.w,
                                                                top: 27.h,
                                                                right: 20.w),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.w),
                                                                  child: Text(
                                                                    "jiwoomin991@gmail.com",
                                                                    style: TextStyles
                                                                        .white1
                                                                        .copyWith(
                                                                            fontSize:
                                                                                15.sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ))
                                                            ]),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 20.w,
                                                          top: 27.h,
                                                          right: 20.w,
                                                        ),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.w),
                                                                  child: Text(
                                                                    "hyein8474@gmail.com",
                                                                    style: TextStyles
                                                                        .white1
                                                                        .copyWith(
                                                                            fontSize:
                                                                                15.sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ))
                                                            ]),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.w,
                                                                top: 27.h,
                                                                right: 20.w,
                                                                bottom: 29.h),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.w),
                                                                  child: Text(
                                                                    "seungwoo624@gmail.com",
                                                                    style: TextStyles
                                                                        .white1
                                                                        .copyWith(
                                                                            fontSize:
                                                                                15.sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ))
                                                            ]),
                                                      ),
                                                    ],
                                                  )),
                                            ]),
                                          ),
                                        ));
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  boxShadow: [],
                                ),
                                child: Card(
                                  elevation: 2,
                                  margin: EdgeInsets.all(0),
                                  color: Color.fromARGB(255, 29, 51, 61)
                                      .withOpacity(0.95),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.help,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Help & Support',
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
                                      SizedBox(height: 70.h,),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 150,
                            height: 45,
                            child: InkWell(
                              onTap: () async {
                                GoogleSignIn().signOut();
                                FirebaseAuth.instance.signOut();
                                Navigator.of(context as BuildContext)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  boxShadow: [],
                                ),
                                child: Card(
                                  elevation: 2,
                                  margin: EdgeInsets.all(0),
                                  color: Colors.redAccent.withOpacity(0.8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Log out',
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
