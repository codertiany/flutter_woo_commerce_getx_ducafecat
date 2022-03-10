import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 图标组件
class IconWidget extends StatelessWidget {
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
  }) : super(key: key);

  IconWidget.image(
    String assetName, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
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
    return icon ?? Container();
  }
}
