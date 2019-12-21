import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_tinder/screens/Splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Tech Tinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      home: SplashPage(),
    );
  }
}
