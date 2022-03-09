import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'index.dart';

class AppTheme {
  /// 亮色主题
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
  );

  /// 暗色主题
  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
  );

  /// 列表行间距 - 10 上下
  static EdgeInsets edgeListRow() => EdgeInsets.symmetric(vertical: 10.w);

  /// 输入框间距 - 10, 20 上下，左右
  static EdgeInsets edgeInput() =>
      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);

  /// 卡片内间距 - 12 上下左右
  static EdgeInsets edgeCard() => EdgeInsets.all(12.w);

  /// 页面内边距 - 16 左右
  static EdgeInsets edgePage() => EdgeInsets.symmetric(horizontal: 16.w);

  /// 标题内容间 - 10
  static EdgeInsets edgeTitleContent() => EdgeInsets.only(top: 10.h);

  /// 段落间距 - 24
  static EdgeInsets edgeParagraph() => EdgeInsets.only(top: 10.h);
}
