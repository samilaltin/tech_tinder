import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

class User {
  String _answer;
  bool _type;

  User(this._answer, this._type);

  User.map(dynamic obj) {
    this._answer = obj['answer'];
    this._type = obj['type'];
  }

  String get answer => _answer;

  bool get type => _type;

  User.fromMap(HashMap map) {
    _type = map['type'].toString().toLowerCase() == "true";
    _answer = map['answer'].toString();
  }
}
