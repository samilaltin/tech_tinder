import 'package:tech_tinder/models/Contents.dart';
import 'package:tech_tinder/models/Users.dart';

class TechTinderResponse {
  List<Content> contents;
  List<Users> users;

  TechTinderResponse.fromJsonMap(Map<String, dynamic> map) {
    contents = List<Content>.from(map["contents"].map((it) => Content.fromJsonMap(it)));
    users = List<Users>.from(map["users"].map((it) => Users.fromJsonMap(it)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contents'] = contents != null ? this.contents.map((v) => v.toJson()).toList() : null;
    data['users'] = users != null ? this.users.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
