import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../i18n/index.dart';
import '../style/theme.dart';
import '../utils/index.dart';
import '../values/index.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  bool firstOpen = false;
  Locale locale =
      PlatformDispatcher.instance.locale; //const Locale('en', 'US');
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  @override
  void onInit() {
    super.onInit();

    firstOpen = Storage().getBool(Constants.storageFirstOpen);
    initLocale();
  }

  @override
  void onReady() {
    super.onReady();
    getPlatform();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  void setAlreadyOpen() {
    Storage().setBool(Constants.storageFirstOpen, true);
  }

  void switchThemeModel() {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppTheme.dark : AppTheme.light,
    );
  }
}
