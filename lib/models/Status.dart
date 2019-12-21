class Status {
  int future;
  int notnow;
  int now;
  int past;

  Status.fromJsonMap(Map<String, dynamic> map)
      : future = map["future"],
        notnow = map["notnow"],
        now = map["now"],
        past = map["past"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['future'] = future;
    data['notnow'] = notnow;
    data['now'] = now;
    data['past'] = past;
    return data;
  }
}
