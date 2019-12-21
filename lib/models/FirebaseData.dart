import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:tech_tinder/models/Content.dart';
import 'package:tech_tinder/models/User.dart';

class FirebaseData {
  List<Content> contents;
  List<User> users;

  FirebaseData.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    List<dynamic> listContent = snapshot["contents"];
    listContent.forEach((val) {
      contents.add(Content.fromMap(HashMap.from(val)));
    });

    List<dynamic> listUser = snapshot["users"];
    listUser.forEach((val) {
      users.add(User.fromMap(HashMap.from(val)));
    });
  }
}
