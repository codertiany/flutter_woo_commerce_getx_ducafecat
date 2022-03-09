import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/services/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/i18n/index.dart';
import 'common/routers/index.dart';
import 'common/style/index.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿尺寸
      builder: () => RefreshConfiguration(
        headerBuilder: () => const ClassicHeader(),
        footerBuilder: () => const ClassicFooter(),
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 80,
        maxOverScrollExtent: 100,
        footerTriggerDistance: 150,
        child: GetMaterialApp(
          title: 'WooCommerce',

          // 样式
          theme: ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,

          // 路由
          initialRoute: RouteNames.splash,
          getPages: RoutePages.list,
          navigatorObservers: [RoutePages.observer],

          // 多语言
          translations: Translation(),
          localizationsDelegates: Translation.localizationsDelegates,
          supportedLocales: Translation.supportedLocales,
          locale: ConfigService.to.locale,
          fallbackLocale: Translation.fallbackLocale,

          // 其它
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
