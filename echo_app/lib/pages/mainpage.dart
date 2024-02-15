import 'package:echo_app/pages/map.dart';
import 'package:echo_app/pages/profile.dart';
import 'package:echo_app/pages/settings.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/home_widget.dart';
import 'home.dart';
import '../widgets/other_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      label: 'My Page',
    ),
  ];

  final List<Widget> _screens = [
    MapSample(),
    const Home(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: _bottomNavBarItems,
          backgroundColor: Color(0xFF0F1A20),
          selectedItemColor: Color(0xFF0F6AE2D), // 선택된 아이템의 색상
          unselectedItemColor: Colors.white, // 선택되지 않은 아이템의 색상
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
