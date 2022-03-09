/// id : 22
/// name : "Bag"
/// slug : "bag"
/// description : ""
/// parent : 0
/// count : 3
/// image : null
/// review_count : 0
/// permalink : "http://localhost/product-category/bag/"

class WpProductCategories {
  WpProductCategories({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.parent,
    this.count,
    this.image,
    this.reviewCount,
    this.permalink,
  });

  WpProductCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    parent = json['parent'];
    count = json['count'];
    image = json['image'];
    reviewCount = json['review_count'];
    permalink = json['permalink'];
  }
  int? id;
  String? name;
  String? slug;
  String? description;
  int? parent;
  int? count;
  dynamic image;
  int? reviewCount;
  String? permalink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['parent'] = parent;
    map['count'] = count;
    map['image'] = image;
    map['review_count'] = reviewCount;
    map['permalink'] = permalink;
    return map;
  }
}
