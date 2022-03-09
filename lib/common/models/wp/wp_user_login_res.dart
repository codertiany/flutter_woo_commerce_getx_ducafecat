/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3QiLCJpYXQiOjE2NDUxNTAzMDEsIm5iZiI6MTY0NTE1MDMwMSwiZXhwIjoxNjQ1NzU1MTAxLCJkYXRhIjp7InVzZXIiOnsiaWQiOiIzIn19fQ.LNTkW171_qRNUEflLOr_cEh8dv8JQC7na5JHDLVamRY"
/// user_email : "hans001@vip.qq.com"
/// user_nicename : "hans001"
/// user_display_name : "hans001"

class WpUserLoginRes {
  WpUserLoginRes({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  WpUserLoginRes.fromJson(dynamic json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
  }
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_email'] = userEmail;
    map['user_nicename'] = userNicename;
    map['user_display_name'] = userDisplayName;
    return map;
  }
}
