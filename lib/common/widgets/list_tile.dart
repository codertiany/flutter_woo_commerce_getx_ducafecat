import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/style/index.dart';

/// 列表行 ListTile 替代版本
class ListTileWidget extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? description;
  final Widget? leading;
  final double? leadingSpace;
  final List<Widget>? trailing;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final CrossAxisAlignment? crossAxisAlignment;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  const ListTileWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.description,
    this.leading,
    this.leadingSpace,
    this.trailing,
    this.padding,
    this.height,
    this.crossAxisAlignment,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  _buildView() {
    List<Widget> ws = [];
    if (leading != null) {
      ws.add(leading!);
      ws.add(SizedBox(
        width: leadingSpace ?? AppSpace.iconTextSmail,
      ));
    }
    if (title != null && subtitle != null) {
      List<Widget> wsTitles = [];
      wsTitles.add(title!);
      wsTitles.add(subtitle!);
      if (description != null) {
        wsTitles.add(description!);
      }
      ws.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: wsTitles,
        ),
      );
    } else if (title != null) {
      ws.add(title!);
    }
    ws.add(const Spacer());
    if (trailing != null) {
      ws.add(
        Column(
          mainAxisAlignment: trailing!.length == 1
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: trailing!,
        ),
      );
      ws.add(SizedBox(
        width: AppSpace.iconTextSmail,
      ));
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height,
        padding: padding,
        child: Row(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: ws,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
