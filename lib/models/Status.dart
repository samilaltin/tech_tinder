import 'package:firebase_database/firebase_database.dart';

class Status {
  String _dontKnow;
  String _future;
  String _past;
  String _present;

  Status(this._dontKnow, this._future, this._past, this._present);

  Status.map(dynamic obj) {
    this._dontKnow = obj['dont_know'];
    this._future = obj['future'];
    this._past = obj['past'];
    this._present = obj['present'];
  }

  String get dontKnow => _dontKnow;

  String get future => _future;

  String get past => _past;

  String get present => _present;

  Status.fromSnapshot(DataSnapshot snapshot) {
    _dontKnow = snapshot.value['dont_know'];
    _future = snapshot.value['future'];
    _past = snapshot.value['past'];
    _present = snapshot.value['present'];
  }
}
