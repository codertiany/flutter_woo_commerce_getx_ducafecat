import 'dart:convert';

import 'package:get/get.dart';

import '../api/index.dart';
import '../models/index.dart';
import '../utils/index.dart';
import '../values/index.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  final _profile = WpUserProfileRes().obs;

  bool get hasToken => token.isNotEmpty;
  bool get isLogin => _isLogin.value;
  WpUserProfileRes get profile => _profile.value;

  Future<void> getProfile() async {
    if (token.isEmpty) return;
    WpUserProfileRes result = await UserAPIs.profile();
    _profile(result);
    _isLogin.value = true;
    Storage().setString(Constants.storageProfile, jsonEncode(result));
  }

  Future<void> logout() async {
    // if (_isLogin.value) await UserAPIs.logout();
    await Storage().remove(Constants.storageToken);
    _profile(WpUserProfileRes());
    _isLogin.value = false;
    token = '';
  }

  @override
  void onInit() {
    super.onInit();
    token = Storage().getString(Constants.storageToken);
    var profileOffline = Storage().getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      _profile(WpUserProfileRes.fromJson(jsonDecode(profileOffline)));
    }
  }

  Future<void> setToken(String value) async {
    await Storage().setString(Constants.storageToken, value);
    token = value;
  }
}
