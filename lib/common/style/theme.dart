import 'package:flutter/material.dart';

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
  static EdgeInsets edgeListRow = const EdgeInsets.symmetric(vertical: 10);

  /// 输入框间距 - 10, 20 上下，左右
  static EdgeInsets edgeInput =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  /// 卡片内间距 - 12 上下左右
  static EdgeInsets edgeCard = const EdgeInsets.all(12);

  /// 页面内边距 - 16 左右
  static EdgeInsets edgePage = const EdgeInsets.symmetric(horizontal: 16);

  /// 标题内容间 - 10
  static EdgeInsets edgeTitleContent = const EdgeInsets.only(top: 10);

  /// 段落间距 - 24
  static EdgeInsets edgeParagraph = const EdgeInsets.only(top: 10);
}
