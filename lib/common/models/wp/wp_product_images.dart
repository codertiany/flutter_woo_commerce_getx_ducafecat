/// id : 44
/// src : "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11.jpg"
/// thumbnail : "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-450x450.jpg"
/// srcset : "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11.jpg 1438w, https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-288x300.jpg 288w, https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-982x1024.jpg 982w, https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-768x801.jpg 768w, https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-600x626.jpg 600w"
/// sizes : "(max-width: 1438px) 100vw, 1438px"
/// name : "713WmL0Bi0L._AC_SL1500_"
/// alt : ""

class WpProductionImages {
  WpProductionImages({
    this.id,
    this.src,
    this.thumbnail,
    this.srcset,
    this.sizes,
    this.name,
    this.alt,
  });

  WpProductionImages.fromJson(dynamic json) {
    id = json['id'];
    src = json['src'];
    thumbnail = json['thumbnail'];
    srcset = json['srcset'];
    sizes = json['sizes'];
    name = json['name'];
    alt = json['alt'];
  }
  int? id;
  String? src;
  String? thumbnail;
  String? srcset;
  String? sizes;
  String? name;
  String? alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['src'] = src;
    map['thumbnail'] = thumbnail;
    map['srcset'] = srcset;
    map['sizes'] = sizes;
    map['name'] = name;
    map['alt'] = alt;
    return map;
  }
}
