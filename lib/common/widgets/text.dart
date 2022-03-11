import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/index.dart';

/// 文字组件
class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines; // 行数
  final bool? softWrap; // 自动换行
  final TextOverflow? overflow; // 溢出

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  const TextWidget({
    Key? key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  }) : super(key: key);

  /// 文字 - 导航
  TextWidget.navigation({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.headlineSmall?.copyWith(
          fontSize: AppTextStyles.headlineSmall?.fontSize,
        ),
        super(key: key);

  /// 文字 - 按钮
  TextWidget.button({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.headline6?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// 文字 - 标题1
  TextWidget.title1(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.headline5?.copyWith(
          fontSize: AppTextStyles.headline5?.fontSize,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// 文字 - 标题2
  TextWidget.title2(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.headline6?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 标题3
  TextWidget.title3(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.headline6?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 正文1
  TextWidget.body1(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.bodyText1?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 正文2
  TextWidget.body2(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.bodyText1?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        super(key: key);

  /// 文字 - 正文3
  TextWidget.body3(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
  })  : style = AppTextStyles.bodyText1?.copyWith(
          fontSize: 9,
          fontWeight: FontWeight.w300,
        ),
        super(key: key);
}
