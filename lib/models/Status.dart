import 'package:firebase_database/firebase_database.dart';

class Status {
  bool _dontKnow;
  int _future;
  int _past;
  int _present;

  Status(this._dontKnow, this._future, this._past, this._present);

  Status.map(dynamic obj) {
    this._dontKnow = obj['dont_know'];
    this._future = obj['future'];
    this._past = obj['past'];
    this._present = obj['present'];
  }

  bool get dontKnow => _dontKnow;

  int get future => _future;

  int get past => _past;

  int get present => _present;

  Status.fromSnapshot(DataSnapshot snapshot) {
    _dontKnow = snapshot.value['dont_know'];
    _future = snapshot.value['future'];
    _past = snapshot.value['past'];
    _present = snapshot.value['present'];
  }
}
