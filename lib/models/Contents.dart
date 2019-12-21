class Content {
  String title;
  String desc;
  String imageUrl;

  Content.fromJsonMap(Map<String, dynamic> map)
      : title = map["title"],
        desc = map["desc"],
        imageUrl = map["imageUrl"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['desc'] = desc;
    data['image_url'] = imageUrl;
    return data;
  }
}
