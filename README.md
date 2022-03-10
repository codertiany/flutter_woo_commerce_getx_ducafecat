# flutter woo commerce getx 电商客户端

## 代码规范

- `common` 目录下相对目录引用,这样以后复制了，能重用。

```sh
import '../extension/index.dart';
import '../style/index.dart';
import 'index.dart';
```

- `flutter_screenutil` 只在 `pages` 层使用，不要写入基础组件，比如 `widget` `button` ，否则写的到处都是很乱。

-

## 初始包

```sh
flutter pub add get intl flutter_screenutil pull_to_refresh flutter_easyloading modal_bottom_sheet dio dio_cookie_manager cookie_jar cached_network_image flutter_cache_manager crypto share device_info package_info permission_handler sentry carousel_slider flutter_svg validatorless flutter_multi_formatter pinput flutter_picker another_xlider photo_view wechat_assets_picker wechat_camera_picker country_code_picker dropdown_button2 shared_preferences
```

## 生成文档

https://pub.flutter-io.cn/packages/dartdoc

```sh
$ dart pub global activate dartdoc
$ dart pub global run dartdoc


$ dart pub global activate dhttpd
$ dhttpd --path doc/api
```
