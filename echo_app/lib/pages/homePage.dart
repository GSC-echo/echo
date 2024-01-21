import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: 'Settings',
    ),
  ];

  final List<Widget> _screens = [
    Center(
      child: Container(
        color: Colors.green,
      ),
    ),
    SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF80BCBD).withOpacity(0.75),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 47.h, left: 21.w, right: 21.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  height: 185.h,
                  width: 351.w,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //icon
                          Padding(
                              padding: EdgeInsets.only(top: 33.h, left: 38.w),
                              child: Row(children: [
                                Image.asset('images/google.png',
                                    width: 100, height: 100),
                                Padding(
                                  padding: EdgeInsets.only(left: 54.w),
                                  child: Text(
                                    "24 points\nsprout stage",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                )
                              ])),
                        ],
                      ),
                      Row(
                        children: [
                          //get a point
                          Padding(
                              padding: EdgeInsets.only(left: 26.w, top: 16.h),
                              child: Row(children: [
                                SizedBox(
                                  width: 126.w,
                                  height: 30.h,
                                  child: TextButton(
                                    child: Text(
                                      "Get a Point",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {
                                      //
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color(0xFF4DC383),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 47.w,
                                ),
                                SizedBox(
                                  width: 126.w,
                                  height: 30.h,
                                  child: TextButton(
                                    child: Text(
                                      "About Stage",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {
                                      //
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color(0xFF4DC383),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 78.h),
                child: Row(
                  children: [
                    //search the course
                    Padding(
                        padding: EdgeInsets.only(left: 27.w),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                            ),
                            height: 116.h,
                            width: 160.w,
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.map_outlined,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Search\nthe\nCourse',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                    //customize a course
                    Padding(
                        padding: EdgeInsets.only(left: 19.w),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                            ),
                            height: 116.h,
                            width: 160.w,
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_searching,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Customize\na Course',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )))
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 19.w, top: 49.h, right: 19.w, bottom: 15.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Your Text Here',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 500.h,
                    width: 355.w,
                  ))
            ],
          ),
        ),
      ),
    ),
    Center(
      child: Container(
        color: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavBarItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
