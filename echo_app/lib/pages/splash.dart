import 'package:echo_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:echo_app/pages/login.dart';
import 'package:echo_app/main.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _log_in = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(body: _log_in ? HomePage() : Login())) ;
  }
}