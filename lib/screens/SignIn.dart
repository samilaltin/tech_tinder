import 'package:flutter/material.dart';
import 'package:tech_tinder/screens/MainPage.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: Image.asset('Assets/login_background.png').image,
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
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
                    onPressed: () {
                      navigateToMainPage(context);
                    },
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
      ),
    );
  }

  void navigateToMainPage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new MainPage()));
  }
}
