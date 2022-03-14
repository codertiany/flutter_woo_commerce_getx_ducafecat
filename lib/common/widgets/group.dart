import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/widgets/index.dart';

import '../models/index.dart';
import '../extension/index.dart';

class GroupItemModel {
  String val; // 必须
  String? label;
  Widget? child;
  GroupItemModel({
    required this.val,
    this.label,
    this.child,
  });
}

/// 分组列表组件
class GroupListWidget extends StatelessWidget {
  final List<Widget> items; // 项目列表
  final double spacing;
  final double runSpacing;

  const GroupListWidget({
    Key? key,
    required this.items,
    this.spacing = 0,
    this.runSpacing = 0,
  }) : super(key: key);

  /// 尺寸
  factory GroupListWidget.size({
    Key? key,
    required List<KeyValueModel<String>> sizeItemList,
    required List<String> values,
    double? size,
    Color? bgColor,
    Color? bgSelectedColor,
  }) = _SizeGroup;

  @override
  Widget build(BuildContext context) {
    return items.toWrap(
      spacing: spacing,
      runSpacing: runSpacing,
    );
  }
}

/// 尺寸
class _SizeGroup extends GroupListWidget {
  final List<String> values;
  final double? size;
  final Color? bgColor;
  final Color? bgSelectedColor;

  _SizeGroup({
    Key? key,
    required List<KeyValueModel<String>> sizeItemList,
    required this.values,
    this.size = 24,
    this.bgColor,
    this.bgSelectedColor,
    double spacing = 20,
    double runSpacing = 10,
  }) : super(
          key: key,
          spacing: spacing,
          runSpacing: runSpacing,
          items: sizeItemList.map((item) {
            return TextWidget.body2(
              item.value,
            )
                .center()
                .decorated(
                  color: bgColor ?? AppColors.surfaceVariant,
                  border: null,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size! / 2),
                  ),
                )
                .tight(width: size, height: size);
          }).toList(),
        );
}
