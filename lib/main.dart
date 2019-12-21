import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_tinder/screens/SplashPage.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(
    MaterialApp(
      title: 'Tech Tinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
