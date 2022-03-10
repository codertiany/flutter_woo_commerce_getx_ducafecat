import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../extension/index.dart';
import '../style/index.dart';
import 'index.dart';

/// 按钮
class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? text; // 文字
  final Widget? icon; // 图标
  final Color? color;
  final Color? bgColor;
  final Color? borderColor;

  const ButtonWidget({
    Key? key,
    this.onTap,
    this.text,
    this.color,
    this.bgColor,
    this.borderColor,
    this.icon,
  }) : super(key: key);

  /// 主要
  ButtonWidget.primary({
    Key? key,
    this.onTap,
    this.text,
    this.icon,
  })  : color = Get.theme.colorScheme.onPrimary,
        bgColor = Get.theme.colorScheme.primary,
        borderColor = Get.theme.colorScheme.primary,
        super(key: key);

  /// 次要
  ButtonWidget.secondary({
    Key? key,
    this.onTap,
    this.text,
    this.icon,
  })  : color = Get.theme.colorScheme.primary,
        bgColor = Get.theme.colorScheme.onSecondary,
        borderColor = Get.theme.colorScheme.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> btns = [];
    if (icon != null) {
      btns.add(icon!);
    }
    if (text != null) {
      if (btns.isNotEmpty) {
        btns.add(SizedBox(
          width: AppEdge.iconText,
        ));
      }
      btns.add(
        TextWidget.button(
          text: text!,
          color: color,
        ),
      );
    }

    return btns
        .toRow(
          mainAxisAlignment: MainAxisAlignment.center,
        )
        .decorated(
            color: bgColor,
            border: Border.all(
              color: borderColor ?? Get.theme.colorScheme.primary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)));
  }
}
