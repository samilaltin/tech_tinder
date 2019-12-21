import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tech_tinder/models/User.dart';
import 'package:tech_tinder/screens/MainPage.dart';
import 'package:tech_tinder/utility/Constants.dart';
import 'package:tech_tinder/utility/SharedPreferencesHelper.dart';
import 'package:tech_tinder/utility/ValidateHelper.dart';

class SignInPage extends StatefulWidget {
  SignInPage() : super();

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignInPage> {
  final _key = new GlobalKey<FormState>();
  User _usermodel;
  String _user;
  FirebaseDatabase firebaseDatabase;

  DatabaseReference ref;

  @override
  void initState() {
    super.initState();

    firebaseDatabase = FirebaseDatabase();
    ref = firebaseDatabase.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: Image
                  .asset('Assets/login_background.png')
                  .image,
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: EdgeInsets.all(23),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: TextFormField(
                        validator: (val) => ValidateHelper.userName(val),
                        onSaved: (val) => _user = val,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Username',
                            labelStyle:
                            TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: () => _signIn(),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: Colors.cyan[600],
                  elevation: 0,
                  minWidth: 350,
                  height: 55,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "FROM",
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Image(
                  height: 75,
                  image: AssetImage('Assets/loodos.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    final form = _key.currentState;

    if (form.validate()) {
      form.save();
      ref.child("users").child("$_user").child("-1").child("answer").set("freee");
      ref.child("users").child("$_user").child("-1").child("type").set(false);
      if (_user.isNotEmpty) {
        SharedPreferencesHelper.putString(_user, Constants.SP_USER_KEY);
        navigateToMainPage(context);
      }
    }
  }

  void navigateToMainPage(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(), fullscreenDialog: false),
              (Route<dynamic> route) => false);
    });
  }
}
