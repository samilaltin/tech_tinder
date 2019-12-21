import 'package:tech_tinder/techTinder/TechTinder.dart';

class TechTinderResponse {
  TechTinder techTinder;

  TechTinderResponse.fromJsonMap(Map<String, dynamic> map)
      : techTinder = TechTinder.fromJsonMap(map["tech_tinder"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tech_tinder'] = techTinder == null ? null : techTinder.toJson();
    return data;
  }
}
