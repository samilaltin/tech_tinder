import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

import 'Status.dart';

class Content {
  String _description;
  String _imageUrl;
  String _sourcePage;
  Status _status;
  String _title;

  Content(this._description, this._imageUrl, this._status, this._sourcePage,
      this._title);

  Content.map(dynamic obj) {
    this._description = obj['description'];
    this._imageUrl = obj['image_url'];
    this._sourcePage = obj['source_page'];
    this._status = obj['status'];
    this._title = obj['title'];
  }

  String get description => _description;

  String get imageUrl => _imageUrl;

  String get sourcePage => _sourcePage;

  Status get status => _status;

  String get title => _title;

  Content.fromMap(HashMap map) {
    _description = map['description'];
    _imageUrl = map['image_url'];
    _sourcePage = map['source_page'];
    _status = map['status'];
    _title = map['title'];
  }
}
