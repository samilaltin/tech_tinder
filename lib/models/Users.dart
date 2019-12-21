class Users {
  String title;
  String description;
  String imageUrl;

  Users.fromJsonMap(Map<String, dynamic> map)
      : title = map["title"],
        description = map["description"],
        imageUrl = map["image_url"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['image_url'] = imageUrl;
    return data;
  }
}
