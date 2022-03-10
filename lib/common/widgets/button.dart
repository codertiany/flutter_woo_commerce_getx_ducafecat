import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../extension/index.dart';
import '../style/index.dart';
import 'index.dart';

/// 按钮
class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;

  final Widget? textWidget;
  final Widget? icon;
  final Color? bgColor;
  final Color? borderColor;
  final double? iconTextSpace;
  final TextDirection? textDirection; // 排列方向
  final bool? isColumn; // 按 column 方式排列

  const ButtonWidget({
    Key? key,
    this.onTap,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textWidget,
    this.bgColor,
    this.borderColor,
    this.icon,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
  }) : super(key: key);

  /// 图标
  const ButtonWidget.icon(
    this.icon, {
    Key? key,
    this.onTap,
    this.textColor,
    this.text,
    this.bgColor,
    this.borderColor,
    this.textWidget,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
  }) : super(key: key);

  /// 图标
  const ButtonWidget.iconText(
    this.icon,
    this.text, {
    Key? key,
    this.onTap,
    this.textColor,
    this.bgColor,
    this.borderColor,
    this.textWidget,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
  }) : super(key: key);

  /// 主要
  ButtonWidget.primary(
    String textString, {
    Key? key,
    this.onTap,
    this.icon,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
  })  : textWidget = TextWidget.button(
          text: textString,
          color: Get.theme.colorScheme.onPrimary,
        ),
        bgColor = Get.theme.colorScheme.primary,
        borderColor = Get.theme.colorScheme.primary,
        super(key: key);

  /// 次要
  ButtonWidget.secondary(
    String textString, {
    Key? key,
    this.onTap,
    this.icon,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
  })  : textWidget = TextWidget.button(
          text: textString,
          color: Get.theme.colorScheme.primary,
        ),
        bgColor = Get.theme.colorScheme.onSecondary,
        borderColor = Get.theme.colorScheme.primary,
        super(key: key);

  /// 文字
  const ButtonWidget.text(
    this.text, {
    Key? key,
    this.onTap,
    this.textColor,
    this.icon,
    this.bgColor,
    this.borderColor,
    this.textWidget,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 组件列表
    List<Widget> btns = [];
    // 图标
    if (icon != null) {
      btns.add(icon!);
    }
    // 文字
    if (text != null) {
      if (btns.isNotEmpty) {
        if (iconTextSpace != null) {
          btns.add(SizedBox(width: iconTextSpace));
        }
      }
      btns.add(
        TextWidget(
          text: text!,
          size: textSize,
          color: textColor ?? Get.theme.colorScheme.onPrimaryContainer,
          weight: textWeight ?? FontWeight.w500,
        ),
      );
    }
    // 文字组件
    if (textWidget != null) {
      if (btns.isNotEmpty) {
        btns.add(SizedBox(width: AppSpace.iconText));
      }
      btns.add(textWidget!);
    }

    // 横向、纵向
    Widget ws;
    if (isColumn == true) {
      ws = btns.toColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: textDirection,
      );
    } else {
      ws = btns.toRow(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: textDirection,
      );
    }

    return ws
        .decorated(
          color: bgColor,
          border: borderColor != null
              ? Border.all(
                  color: borderColor ?? Get.theme.colorScheme.primary,
                )
              : null,
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.button),
          ),
        )
        .gestures(
          onTap: onTap,
        );
  }
}
