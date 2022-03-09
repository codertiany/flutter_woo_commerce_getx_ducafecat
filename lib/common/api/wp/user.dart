import '../../models/index.dart';
import '../../services/index.dart';

class UserAPIs {
  static Future<WpUserLoginRes> login(WpUserLoginReq req) async {
    var res = await WPHttpService.to.post(
      '/jwt-auth/v1/token',
      data: req,
    );
    return WpUserLoginRes.fromJson(res);
  }

  static Future<WpRes> register(WpUseRegisterReq req) async {
    var res = await WPHttpService.to.post(
      '/wp/v2/users/register',
      data: req,
    );
    return WpRes.fromJson(res);
  }

  static Future<WpUserProfileRes> profile() async {
    var res = await WPHttpService.to.post(
      '/wp/v2/users/me',
    );
    return WpUserProfileRes.fromJson(res);
  }

  // static Future<void> logout() async {
  //   return WPHttpService.to.post(
  //     '/app/logout',
  //   );
  // }
}
