import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:tech_tinder/models/Content.dart';
import 'package:tech_tinder/models/User.dart';

class FirebaseData {
  List<Content> contents;
  User user;

  FirebaseData.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    if (contents == null) {
      contents = List();
    }
    List<dynamic> listContent = snapshot["contents"];
    listContent.forEach((val) {
      contents.add(Content.fromMap(HashMap<String, dynamic>.from(val)));
    });
    user = User.fromMap(HashMap<String,dynamic>.from(snapshot["users"]["canberk"]["-1"]));
  }
}
