import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'locale_en.dart';
import 'locale_zh.dart';

/*

https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
https://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html

*/

class Translation extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  @override
  Map<String, Map<String, String>> get keys => {
        'en': LocaleMaps.en,
        'zh': LocaleMaps.zh,
      };
}

class LocaleMaps {
  static Map<String, String> en = localeEn;
  static Map<String, String> zh = localeZh;
}
