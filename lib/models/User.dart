import 'package:firebase_database/firebase_database.dart';

class User {
  String _answer;
  String _type;

  User(this._answer, this._type);

  User.map(dynamic obj) {
    this._answer = obj['answer'];
    this._type = obj['type'];
  }

  String get answer => _answer;

  String get type => _type;

  User.fromSnapshot(DataSnapshot snapshot) {
    _answer = snapshot.value['answer'];
    _type = snapshot.value['type'];
  }
}
