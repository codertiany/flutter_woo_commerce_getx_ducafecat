/// id : 2
/// name : "Color"
/// taxonomy : "pa_color"
/// type : "select"
/// order : "menu_order"
/// has_archives : false
/// count : 6

class WpProductAttributes {
  WpProductAttributes({
    this.id,
    this.name,
    this.taxonomy,
    this.type,
    this.order,
    this.hasArchives,
    this.count,
  });

  WpProductAttributes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    taxonomy = json['taxonomy'];
    type = json['type'];
    order = json['order'];
    hasArchives = json['has_archives'];
    count = json['count'];
  }
  int? id;
  String? name;
  String? taxonomy;
  String? type;
  String? order;
  bool? hasArchives;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['taxonomy'] = taxonomy;
    map['type'] = type;
    map['order'] = order;
    map['has_archives'] = hasArchives;
    map['count'] = count;
    return map;
  }
}
