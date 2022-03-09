/// id : 3
/// username : "hans001"
/// name : "hans001"
/// first_name : ""
/// last_name : ""
/// email : "hans001@vip.qq.com"
/// url : ""
/// description : ""
/// link : "http://localhost/author/hans001/"
/// locale : "zh_CN"
/// nickname : "hans001"
/// slug : "hans001"
/// registered_date : "2022-02-18T01:12:46+00:00"

class WpUserProfileRes {
  WpUserProfileRes({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.registeredDate,
  });

  WpUserProfileRes.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    url = json['url'];
    description = json['description'];
    link = json['link'];
    locale = json['locale'];
    nickname = json['nickname'];
    slug = json['slug'];
    registeredDate = json['registered_date'];
  }
  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? url;
  String? description;
  String? link;
  String? locale;
  String? nickname;
  String? slug;
  String? registeredDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['name'] = name;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['url'] = url;
    map['description'] = description;
    map['link'] = link;
    map['locale'] = locale;
    map['nickname'] = nickname;
    map['slug'] = slug;
    map['registered_date'] = registeredDate;
    return map;
  }
}
