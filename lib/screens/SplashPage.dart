import 'package:flutter/material.dart';
import 'package:tech_tinder/screens/MainPage.dart';
import 'package:tech_tinder/screens/SignInPage.dart';
import 'package:tech_tinder/utility/Constants.dart';
import 'package:tech_tinder/utility/SharedPreferencesHelper.dart';

class SplashPage extends StatefulWidget {
  SplashPageState _state;

  SplashPage() {
    _state = new SplashPageState();
  }

  SplashPageState createState() => _state;
}

class SplashPageState extends State<SplashPage> {
  AnimationController animationController;
  Animation<double> animation;
  var isProgressVisible = true;
  var isLogoVisible = true;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getString(Constants.SP_USER_KEY).then((val) {
      if (val != null && val.isNotEmpty) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MainPage(), fullscreenDialog: false),
            (Route<dynamic> route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => SignInPage(), fullscreenDialog: false),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return new Container(
        height: double.maxFinite,
        width: double.maxFinite,
      );
    }));
  }
}
