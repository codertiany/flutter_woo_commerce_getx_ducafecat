import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/widgets/index.dart';

import '../style/index.dart';

/// 单选框
class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final double? size;
  final Color? bgColor;
  final Color? bgColorChecked;
  final double? fontSize;
  final Color? fontColor;
  final bool? isBorder;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? space;
  final Function(bool value)? onChanged;

  const CheckBoxWidget({
    Key? key,
    required this.value,
    this.onChanged,
    this.size = 20,
    this.bgColor,
    this.bgColorChecked,
    this.fontSize = 14,
    this.fontColor,
    this.isBorder = true,
    this.borderColor,
    this.padding = const EdgeInsets.all(0),
    this.child,
    this.space = 14,
  }) : super(key: key);

  /// 样式1 - 全选
  CheckBoxWidget.all(
    this.value,
    this.onChanged, {
    Key? key,
    Color? borderColor,
    Color? fontColor,
    this.fontSize = 16,
    this.size = 24,
    this.bgColor,
    this.bgColorChecked,
    this.isBorder = true,
    this.padding = const EdgeInsets.all(0),
    this.child,
    double? space,
  })  : borderColor = borderColor ?? AppColors.outline,
        fontColor = fontColor ?? AppColors.checkbox,
        space = space ?? AppSpace.iconTextSmail,
        super(key: key);

  /// 样式2 - 行选中
  CheckBoxWidget.single(
    this.value,
    this.onChanged, {
    Key? key,
    this.borderColor,
    Color? fontColor,
    this.fontSize = 14,
    this.size = 20,
    Color? bgColor,
    Color? bgColorChecked,
    this.isBorder = false,
    this.padding = const EdgeInsets.all(0),
    this.child,
    double? space,
  })  : fontColor = fontColor ?? AppColors.onPrimaryContainer,
        space = space ?? AppSpace.iconTextSmail,
        bgColor = bgColor ?? AppColors.surfaceVariant.withOpacity(0.3),
        bgColorChecked = bgColorChecked ?? AppColors.primaryContainer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    ws.add(Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: value ? bgColorChecked : bgColor,
        borderRadius: BorderRadius.all(Radius.circular(size! / 2)),
        border: isBorder == true
            ? Border.all(
                color: borderColor ?? AppColors.outline,
                width: 1,
              )
            : null,
      ),
      child: value
          ? IconWidget.icon(
              Icons.check,
              size: fontSize,
              color: fontColor,
            )
          : null,
    ));

    if (child != null) {
      ws.add(SizedBox(width: space));
      ws.add(child!);
    }

    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Padding(
        padding: padding!,
        child: Row(children: ws),
      ),
    );
  }
}
