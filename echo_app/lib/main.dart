import 'package:echo_app/config/colors.dart';
import 'package:echo_app/firebase_options.dart';
import 'package:echo_app/pages/mainpage.dart';
import 'package:echo_app/pages/settings.dart';
import 'package:echo_app/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Splash());
  //runApp(const MyApp());
  //runApp(const Settings());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp(
          title: 'Echo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Welcome to Echo'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('lib/config/images/echo.png', width: 250, height: 250),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(BackgroundColor.mainGreen.withOpacity(0.75)),
          elevation:
              MaterialStateProperty.all<double>(3), 
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), 
            ),
          ),
        ),
        child: const Text(
          "Go!",
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        // },
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
      ),
    ])));
  }
}
