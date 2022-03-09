class WpUseRegisterReq {
  String? username;
  String? email;
  String? password;

  WpUseRegisterReq({this.username, this.email, this.password});

  factory WpUseRegisterReq.fromJson(Map<String, dynamic> json) {
    return WpUseRegisterReq(
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
      };
}
