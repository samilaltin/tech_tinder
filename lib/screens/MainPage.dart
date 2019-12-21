import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tech_tinder/models/FirebaseData.dart';
import 'package:tech_tinder/utility/Constants.dart';
import 'package:tech_tinder/widgets/SwipeCards.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TinderSwapCard cards;
  FirebaseData firebaseData;

  @override
  void initState() {
    super.initState();
    FirebaseDatabase firebaseDatabase = FirebaseDatabase();
    DatabaseReference ref = firebaseDatabase.reference();
    ref.once().then((DataSnapshot data) {
      setState(() {
        firebaseData = FirebaseData.fromSnapshot(data.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.
    DatabaseReference ref;

    cards = new TinderSwapCard(
        orientation: AmassOrientation.TOP,
        totalNum: firebaseData.contents.length,
        stackNum: 3,
        swipeEdge: 4.0,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.width * 0.9,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.width * 0.8,
        cardBuilder: (context, index) => Card(
                child: Container(
                    child: Column(
              children: <Widget>[
                Flexible(
                  child: firebaseData.contents == null
                      ? Container()
                      : Image.network(
                          firebaseData.contents[index].imageUrl,
                        ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: firebaseData.contents[index].title,
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ]),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Text(
                    firebaseData.contents[index].description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ))),
        cardController: controller = CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          /// Get swiping card's alignment
          if (align.x < 0) {
            //Card is LEFT swiping
          } else if (align.x > 0) {
            //Card is RIGHT swiping
          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          orientation.index;
        });

    final footerBtns = Container(
      child: Row(
        children: <Widget>[
          Flexible(
              child: _buildCircularBtn(40.0, ButtonImages.back, 1, clickk)),
          Flexible(
              child: _buildCircularBtn(70.0, ButtonImages.hate, 2, clickk)),
          Flexible(
              child: _buildCircularBtn(70.0, ButtonImages.like, 3, clickk)),
          Flexible(
              child: _buildCircularBtn(40.0, ButtonImages.list, 4, clickk)),
        ],
      ),
    );
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: cards,
              ),
            ),
            Flexible(
              child: footerBtns,
            ),
          ],
        ),
      ),
    );
  }

  clickk() {
    if (cards.state.widget.stackNum > 1) {
      cards.state.changeCardOrder();
    }
  }

  MaterialButton _buildCircularBtn(
      double height, String img, int type, Function press) {
    double imageSize;

    if (type == 1 || type == 4) {
      imageSize = 25.0;
    } else {
      imageSize = 35.0;
    }

    return MaterialButton(
      color: Colors.white,
      elevation: 4.0,
      onPressed: () {
        press();
      },
      height: height,
      shape: CircleBorder(),
      child: Container(
        height: 40.0,
        child: Image.asset(
          img,
          height: imageSize,
          width: imageSize,
        ),
      ),
    );
  }
}
