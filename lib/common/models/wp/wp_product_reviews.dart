import '../index.dart';

class WpProductReviews {
  WpProductReviews({
    this.id,
    this.dateCreated,
    this.formattedDateCreated,
    this.dateCreatedGmt,
    this.productId,
    this.productName,
    this.productPermalink,
    this.productImage,
    this.reviewer,
    this.review,
    this.rating,
    this.verified,
    this.reviewerAvatarUrls,
  });

  WpProductReviews.fromJson(dynamic json) {
    id = json['id'];
    dateCreated = json['date_created'];
    formattedDateCreated = json['formatted_date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    productId = json['product_id'];
    productName = json['product_name'];
    productPermalink = json['product_permalink'];
    productImage = json['product_image'] != null
        ? WpProductionImages.fromJson(json['productImage'])
        : null;
    reviewer = json['reviewer'];
    review = json['review'];
    rating = json['rating'];
    verified = json['verified'];
    reviewerAvatarUrls = json['reviewer_avatar_urls'];
  }
  int? id;
  String? dateCreated;
  String? formattedDateCreated;
  String? dateCreatedGmt;
  int? productId;
  String? productName;
  String? productPermalink;
  WpProductionImages? productImage;
  String? reviewer;
  String? review;
  int? rating;
  bool? verified;
  Map<String, String>? reviewerAvatarUrls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_created'] = dateCreated;
    map['formatted_date_created'] = formattedDateCreated;
    map['date_created_gmt'] = dateCreatedGmt;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_permalink'] = productPermalink;
    if (productImage != null) {
      map['product_image'] = productImage?.toJson();
    }
    map['reviewer'] = reviewer;
    map['review'] = review;
    map['rating'] = rating;
    map['verified'] = verified;
    map['reviewer_avatar_urls'] = reviewerAvatarUrls;
    return map;
  }
}
