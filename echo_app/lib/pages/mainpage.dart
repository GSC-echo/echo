import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/home_widget.dart';
import 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
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
    const Home(),
    Center(
      child: Container(
        color: Colors.blue,
      ),
    ),
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
            backgroundColor: const Color(0xFF5DCA75).withOpacity(0.65),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ));
  }
}
