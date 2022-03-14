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
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> sizeItemList,
    required List<String> values,
    double? size,
    Color? bgColor,
    Color? bgSelectedColor,
    double? spacing,
    double? runSpacing,
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
  _SizeGroup({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> sizeItemList,
    required List<String> values,
    double? size,
    Color? bgColor,
    Color? bgSelectedColor,
    double? spacing,
    double? runSpacing,
  }) : super(
          key: key,
          spacing: spacing ?? 5,
          runSpacing: runSpacing ?? 5,
          items: sizeItemList.map((item) {
            return TextWidget.body3(
              item.value,
            )
                .center()
                .decorated(
                  color: values.hasValue(item.key) == true
                      ? bgSelectedColor ?? AppColors.tertiaryContainer
                      : bgColor ?? AppColors.surfaceVariant.withOpacity(0.5),
                  border: null,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size ?? 24 / 2),
                  ),
                )
                .tight(width: size, height: size)
                .gestures(
                  onTap: onTap != null
                      ? () {
                          if (values.hasValue(item.key)) {
                            values.remove(item.key);
                          } else {
                            values.add(item.key);
                          }
                          onTap(values);
                        }
                      : null,
                );
          }).toList(),
        );
}
