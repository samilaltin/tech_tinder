import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _contents;
  DatabaseReference _users;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  int _counter;
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    // Demonstrates configuring to the database using a file
    _contents = FirebaseDatabase.instance.reference().child('contents');
    // Demonstrates configuring the database directly

    _users = database.reference().child('users');
//    database.reference().child('contents').once().then((DataSnapshot snapshot) {
//      print('Connected to second database and read ${snapshot.value}');
//    });
    database.reference().onValue.listen((e) {
      DataSnapshot datasnapshot = e.snapshot;
      // Do something with datasnapshot
      print('Connected to second database and read ${datasnapshot.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _contents.keepSynced(true);

    _counterSubscription = _contents.onValue.listen((Event event) {
      error = null;
      _counter = event.snapshot.value ?? 0;
    }, onError: (Object o) {
      error = o;
    });
  }

  DatabaseError getError() {
    return error;
  }

  int getCounter() {
    return _counter;
  }

  DatabaseReference getUser() {
    return _users;
  }

//  addUser(User user) async {
//    final TransactionResult transactionResult =
//    await _counterRef.runTransaction((MutableData mutableData) async {
//      mutableData.value = (mutableData.value ?? 0) + 1;
//
//      return mutableData;
//    });
//
//    if (transactionResult.committed) {
//      _userRef.push().set(<String, String>{
//        "name": "" + user.name,
//        "age": "" + user.age,
//        "email": "" + user.email,
//        "mobile": "" + user.mobile,
//      }).then((_) {
//        print('Transaction  committed.');
//      });
//    } else {
//      print('Transaction not committed.');
//      if (transactionResult.error != null) {
//        print(transactionResult.error.message);
//      }
//    }
//  }
//
//  void deleteUser(User user) async {
//    await _userRef.child(user.id).remove().then((_) {
//      print('Transaction  committed.');
//    });
//  }
//
//  void updateUser(User user) async {
//    await _userRef.child(user.id).update({
//      "name": "" + user.name,
//      "age": "" + user.age,
//      "email": "" + user.email,
//      "mobile": "" + user.mobile,
//    }).then((_) {
//      print('Transaction  committed.');
//    });
//  }

  void dispose() {
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }
}
