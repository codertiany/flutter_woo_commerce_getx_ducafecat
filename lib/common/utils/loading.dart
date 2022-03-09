import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  static const int _milliseconds = 300; // 提示 延迟毫秒, 提示体验 秒关太快
  static const int _dismissMilliseconds = 2000; // dismiss 延迟毫秒

  Loading.init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: _dismissMilliseconds)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 2
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black.withOpacity(0.7)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.6)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.show(status: text ?? 'Loading...');
  }

  static void error([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showError(text ?? 'Error'),
    );
  }

  static void success([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showSuccess(text ?? 'Success'),
    );
  }

  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  static Future<void> dismiss() async {
    await Future.delayed(
      const Duration(milliseconds: _dismissMilliseconds),
      () {
        EasyLoading.instance.userInteractions = true; // 恢复交互操作
        EasyLoading.dismiss();
      },
    );
  }
}
