class WpRes {
  String? code;
  String? message;
  WpDataRes? data;

  WpRes({this.code, this.message, this.data});

  factory WpRes.fromJson(Map<String, dynamic> json) => WpRes(
        code: json['code'].toString(),
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : WpDataRes.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };
}

class WpDataRes {
  int? status;

  WpDataRes({this.status});

  factory WpDataRes.fromJson(Map<String, dynamic> json) => WpDataRes(
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
      };
}
