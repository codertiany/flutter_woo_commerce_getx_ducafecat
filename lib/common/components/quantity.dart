import 'package:flutter/cupertino.dart';

import '../index.dart';

/// 数量编辑
class QuantityWidget extends StatelessWidget {
  final Function(int quantity) onChange;
  final int quantity;
  final String? id;
  final double? size;
  final double? fontSize;
  final double? paddingHorizontal;
  final Color? color;

  QuantityWidget({
    Key? key,
    this.id,
    required this.quantity,
    required this.onChange,
    this.size,
    this.fontSize,
    this.paddingHorizontal,
    Color? color,
  })  : color = color ?? AppColors.onSurfaceVariant,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 减号
        ButtonWidget.icon(
          Icon(
            CupertinoIcons.minus,
            size: fontSize ?? 14,
            color: color,
          ),
          onTap: () => onChange(quantity - 1 < 0 ? 0 : quantity - 1),
        ),

        // 数量
        TextWidget.body2(
          "$quantity",
          color: color,
        )
            .center()
            .tight(width: size ?? 24, height: size ?? 24)
            .decorated(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: color!, width: 1),
            )
            .paddingHorizontal(paddingHorizontal ?? AppSpace.iconTextSmail),

        // 加号
        ButtonWidget.icon(
          Icon(
            CupertinoIcons.plus,
            size: fontSize ?? 14,
            color: AppColors.highlight,
          ),
          onTap: () => onChange(quantity + 1),
        ),
      ],
    );
  }
}
