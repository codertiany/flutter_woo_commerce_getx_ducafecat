import '../index.dart';

class WpProduct {
  WpProduct({
    this.id,
    this.name,
    this.parent,
    this.type,
    this.variation,
    this.permalink,
    this.sku,
    this.shortDescription,
    this.description,
    this.onSale,
    this.prices,
    this.priceHtml,
    this.averageRating,
    this.reviewCount,
    this.images,
    this.categories,
    this.tags,
    this.attributes,
    this.hasOptions,
    this.isPurchasable,
    this.isInStock,
    this.isOnBackorder,
    this.lowStockRemaining,
    this.soldIndividually,
    this.quantityLimit,
  });

  WpProduct.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    type = json['type'];
    variation = json['variation'];
    permalink = json['permalink'];
    sku = json['sku'];
    shortDescription = json['short_description'];
    description = json['description'];
    onSale = json['on_sale'];
    prices = json['prices'] != null
        ? WpProductPrices.fromJson(json['prices'])
        : null;
    priceHtml = json['price_html'];
    averageRating = json['average_rating'];
    reviewCount = json['review_count'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(WpProductionImages.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(WpProductCategories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(WpProductTags.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes?.add(WpProductAttributes.fromJson(v));
      });
    }
    hasOptions = json['has_options'];
    isPurchasable = json['is_purchasable'];
    isInStock = json['is_in_stock'];
    isOnBackorder = json['is_on_backorder'];
    lowStockRemaining = json['low_stock_remaining'];
    soldIndividually = json['sold_individually'];
    quantityLimit = json['quantity_limit'];
  }
  int? id;
  String? name;
  int? parent;
  String? type;
  String? variation;
  String? permalink;
  String? sku;
  String? shortDescription;
  String? description;
  bool? onSale;
  WpProductPrices? prices;
  String? priceHtml;
  String? averageRating;
  int? reviewCount;
  List<WpProductionImages>? images;
  List<WpProductCategories>? categories;
  List<WpProductTags>? tags;
  List<WpProductAttributes>? attributes;
  bool? hasOptions;
  bool? isPurchasable;
  bool? isInStock;
  bool? isOnBackorder;
  dynamic lowStockRemaining;
  bool? soldIndividually;
  int? quantityLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['parent'] = parent;
    map['type'] = type;
    map['variation'] = variation;
    map['permalink'] = permalink;
    map['sku'] = sku;
    map['short_description'] = shortDescription;
    map['description'] = description;
    map['on_sale'] = onSale;
    if (prices != null) {
      map['prices'] = prices?.toJson();
    }
    map['price_html'] = priceHtml;
    map['average_rating'] = averageRating;
    map['review_count'] = reviewCount;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      map['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    map['has_options'] = hasOptions;
    map['is_purchasable'] = isPurchasable;
    map['is_in_stock'] = isInStock;
    map['is_on_backorder'] = isOnBackorder;
    map['low_stock_remaining'] = lowStockRemaining;
    map['sold_individually'] = soldIndividually;
    map['quantity_limit'] = quantityLimit;

    return map;
  }
}
