/// id : 18
/// name : "GetX"
/// slug : "getx"
/// description : ""
/// parent : 0
/// count : 1

class WpProductTags {
  WpProductTags({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.parent,
    this.count,
  });

  WpProductTags.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    parent = json['parent'];
    count = json['count'];
  }
  int? id;
  String? name;
  String? slug;
  String? description;
  int? parent;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['parent'] = parent;
    map['count'] = count;
    return map;
  }
}
