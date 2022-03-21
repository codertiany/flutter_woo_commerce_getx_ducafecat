import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/style/index.dart';

import '../extension/index.dart';

/// 列表行 ListTile 替代版本
class ListTileWidget extends StatelessWidget {
  // 标题/子标题/描述
  final Widget? title;
  final Widget? subtitle;
  final Widget? description;
  // 左侧图标
  final Widget? leading;
  final double? leadingSpace;
  // 右侧图标
  final List<Widget>? trailing;

  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  ListTileWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.description,
    this.leading,
    this.leadingSpace,
    this.trailing,
    EdgeInsetsGeometry? padding,
    this.crossAxisAlignment,
    this.onTap,
    this.onLongPress,
  })  : padding = padding ?? AppSpace.edgeInput,
        super(key: key);

  _buildView() {
    List<Widget> ws = [];

    // 头部图标
    if (leading != null) {
      ws.add(
        leading!.paddingRight(
          leadingSpace ?? AppSpace.iconTextSmail,
        ),
      );
    }

    // 标题/子标题/描述
    ws.add(
      <Widget>[
        if (title != null) title!,
        if (subtitle != null) subtitle!,
        if (description != null) description!,
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    );

    // 右侧图标
    if (trailing != null) {
      ws.add(
        trailing!.toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    }

    return ws
        .toRow(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        )
        // .backgroundColor(AppColors.background)
        .padding(value: padding)
        .onTap(onTap)
        .onLongPress(onLongPress);
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
