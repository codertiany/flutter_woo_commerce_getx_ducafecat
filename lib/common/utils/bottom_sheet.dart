import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// 底部弹出对话框
class ActionBottomSheet {
  static Future<void> show({
    BuildContext? context,
    Widget? child,
    EdgeInsetsGeometry? contentPadding,
  }) async {
    return await showMaterialModalBottomSheet(
      context: context ?? Get.context!,
      expand: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Material(
        child: SafeArea(
          top: false,
          child: child ?? Container(),
        ),
      ),
    );
  }

  static Future<void> barModal({
    BuildContext? context,
    Widget? child,
    EdgeInsetsGeometry? contentPadding,
  }) async {
    return await showBarModalBottomSheet(
      context: context ?? Get.context!,
      expand: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Material(
        child: SafeArea(
          bottom: false,
          child: child ?? Container(),
        ),
      ),
    );
  }

  static Future<void> materialModal({
    BuildContext? context,
    Widget? child,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsets? safeAreaMinimum,
  }) async {
    return await showMaterialModalBottomSheet(
      context: context ?? Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) => SafeArea(
        minimum: safeAreaMinimum ?? EdgeInsets.all(AppSpace.card),
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 150),
          child: child,
        ),
      ),
    );
  }
}
