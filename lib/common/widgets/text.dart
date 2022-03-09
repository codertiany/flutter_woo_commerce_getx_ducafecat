import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 文字 Widget
class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines; // 行数
  final bool? softWrap; // 自动换行
  final TextOverflow? overflow; // 溢出

  const TextWidget({
    Key? key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  /// 文字 - 导航
  TextWidget.navigation({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.headlineSmall?.copyWith(
          fontSize: Get.textTheme.headlineSmall?.fontSize?.sp,
        ),
        super(key: key);

  /// 文字 - 标题1
  TextWidget.title1({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.headline5?.copyWith(
          fontSize: Get.textTheme.headline5?.fontSize?.sp,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  /// 文字 - 标题2
  TextWidget.title2({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.headline6?.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 标题3
  TextWidget.title3({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.headline6?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 正文1
  TextWidget.body1({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.bodyText1?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 正文2
  TextWidget.body2({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.bodyText1?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        super(key: key);

  /// 文字 - 正文3
  TextWidget.body3({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
  })  : style = Get.textTheme.bodyText1?.copyWith(
          fontSize: 9.sp,
          fontWeight: FontWeight.w300,
        ),
        super(key: key);
}
