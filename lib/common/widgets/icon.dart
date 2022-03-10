import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// 图标组件
class IconWidget extends StatelessWidget {
  final IconData? iconData;
  final Widget? icon;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;

  const IconWidget({
    Key? key,
    this.icon,
    this.size,
    this.width,
    this.height,
    this.color,
    this.iconData,
  }) : super(key: key);

  IconWidget.image(
    String assetName, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
  })  : icon = Image.asset(
          assetName,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: BoxFit.contain,
        ),
        super(key: key) {
    return;
  }

  IconWidget.svg(
    String assetName, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
  })  : icon = SvgPicture.asset(
          assetName,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: BoxFit.contain,
        ),
        super(key: key) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return icon!;
    }
    if (iconData != null) {
      return Icon(
        iconData,
        size: size,
        color: color ?? Get.theme.colorScheme.onPrimaryContainer,
      );
    }
    return Container();
  }
}
