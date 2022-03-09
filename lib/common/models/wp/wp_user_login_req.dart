class WpUserLoginReq {
  String? username;
  String? password;

  WpUserLoginReq({this.username, this.password});

  factory WpUserLoginReq.fromJson(Map<String, dynamic> json) {
    return WpUserLoginReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
