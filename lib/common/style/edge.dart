import 'package:flutter/material.dart';

/// 间距
class AppEdge {
  /// 卡片内 - 12 上下左右
  static double get edgeCard => 12;

  /// 输入框 - 10, 20 上下，左右
  static EdgeInsets get input =>
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  /// 列表行 - 10 上下
  static double get listRow => 10;

  /// 页面内 - 16 左右
  static double get edgePage => 16;

  /// 段落 - 24
  static double get paragraph => 10;

  /// 标题内容 - 10
  static double get titleContent => 10;

  /// 图标文字 - 15
  static double get iconText => 15;
}
