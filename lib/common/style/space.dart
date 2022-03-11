import 'package:flutter/material.dart';

/// 间距
class AppSpace {
  /// 卡片内 - 12 上下左右
  static double get card => 12;

  /// 输入框 - 10, 10 上下，左右
  static EdgeInsetsGeometry get input =>
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  /// 列表行 - 10 上下
  static double get listRow => 10;

  /// 页面内 - 16 左右
  static double get edgePage => 16;

  /// 段落 - 24
  static double get paragraph => 24;

  /// 标题内容 - 10
  static double get titleContent => 10;

  /// 图标文字 - 15
  static double get iconTextSmail => 5;
  static double get iconTextMedium => 10;
  static double get iconTextLarge => 15;
}
