import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../extension/index.dart';
import '../style/index.dart';
import 'index.dart';

/// 按钮
class ButtonWidget extends StatelessWidget {
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 文字尺寸
  final double? textSize;

  /// 文字颜色
  final Color? textColor;

  /// 文字 weight
  final FontWeight? textWeight;

  /// 文字组件
  final Widget? textWidget;

  /// 图标组件
  final Widget? icon;

  /// 背景色
  final Color? bgColor;

  /// 边框色
  final Color? borderColor;

  /// 边框圆角
  final double? borderRadius;

  /// 图标文字间距
  final double? iconTextSpace;

  /// 文字方向 左->右 ，右->左
  final TextDirection? textDirection;

  /// 方式排列 column
  final bool? isColumn;

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
    this.borderRadius,
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
    this.borderRadius,
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
    this.borderRadius,
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
    this.borderRadius,
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
    this.borderRadius,
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
    this.borderRadius,
  }) : super(key: key);

  /// 文字/填充
  ButtonWidget.textFilled(
    String textString,
    this.bgColor, {
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
    this.borderColor,
    this.borderRadius,
  })  : textWidget = TextWidget.button(
          text: textString,
          size: textSize,
          color: textColor ?? Get.theme.colorScheme.onPrimaryContainer,
        ),
        super(key: key);

  /// 文字/填充/圆形 按钮
  ButtonWidget.textRoundFilled(
    String textString,
    this.bgColor,
    this.borderRadius, {
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
    this.borderColor,
  })  : textWidget = TextWidget.button(
          text: textString,
          size: textSize,
          weight: FontWeight.w300,
          color: textColor ?? Get.theme.colorScheme.onPrimaryContainer,
        ),
        super(key: key);

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
            Radius.circular(borderRadius ?? AppRadius.button),
          ),
        )
        .gestures(
          onTap: onTap,
        );
  }
}
