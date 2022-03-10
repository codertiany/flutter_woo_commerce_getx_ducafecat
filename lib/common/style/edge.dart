import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 间距
class AppEdge {
  /// 卡片内 - 12 上下左右
  static double get edgeCard => 12.w;

  /// 输入框 - 10, 20 上下，左右
  static EdgeInsets get input =>
      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);

  /// 列表行 - 10 上下
  static double get listRow => 10.h;

  /// 页面内 - 16 左右
  static double get edgePage => 16.w;

  /// 段落 - 24
  static double get paragraph => 10.h;

  /// 标题内容 - 10
  static double get titleContent => 10.h;

  /// 图标文字 - 15
  static double get iconText => 15.w;
}
