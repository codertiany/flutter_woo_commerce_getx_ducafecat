import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/widgets/index.dart';

import '../extension/index.dart';
import '../models/index.dart';

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
  factory GroupListWidget.sizes({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? bgColor,
    Color? bgSelectedColor,
    double? spacing,
    double? runSpacing,
  }) = _SizesGroup;

  /// 颜色
  factory GroupListWidget.colors({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? borderSelectedColor,
    double? spacing,
    double? runSpacing,
  }) = _ColorsGroup;

  @override
  Widget build(BuildContext context) {
    return items.toWrap(
      spacing: spacing,
      runSpacing: runSpacing,
    );
  }
}

/// 尺寸
class _SizesGroup extends GroupListWidget {
  _SizesGroup({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
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
          items: itemList.map((item) {
            return TextWidget.body3(
              item.value ?? "-",
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

/// 颜色
class _ColorsGroup extends GroupListWidget {
  _ColorsGroup({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? borderSelectedColor,
    double? spacing,
    double? runSpacing,
  }) : super(
          key: key,
          spacing: spacing ?? 5,
          runSpacing: runSpacing ?? 5,
          items: itemList.map((item) {
            return SizedBox(
              width: size ?? 24,
              height: size ?? 24,
            )
                .decorated(
                  color: item.key.toColor,
                  border: values.hasValue(item.key) == true
                      ? Border.all(
                          color: borderSelectedColor ?? AppColors.outline,
                          width: 2,
                        )
                      : null,
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
