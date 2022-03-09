import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 间距
class AppEdge {
  /// 卡片内 - 12 上下左右
  static EdgeInsets edgeCard() => EdgeInsets.all(12.w);

  /// 输入框 - 10, 20 上下，左右
  static EdgeInsets edgeInput() =>
      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);

  /// 列表行 - 10 上下
  static EdgeInsets edgeListRow() => EdgeInsets.symmetric(vertical: 10.w);

  /// 页面内 - 16 左右
  static EdgeInsets edgePage() => EdgeInsets.symmetric(horizontal: 16.w);

  /// 段落 - 24
  static EdgeInsets edgeParagraph() => EdgeInsets.only(top: 10.h);

  /// 标题内容 - 10
  static EdgeInsets edgeTitleContent() => EdgeInsets.only(top: 10.h);
}
