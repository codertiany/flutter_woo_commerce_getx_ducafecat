import 'package:flutter/material.dart';

/// 扩展 ColorScheme
extension ExColorScheme on ColorScheme {
  get isDark => brightness == Brightness.dark;

  /// 按钮
  Color get button =>
      isDark ? const Color(0xFFB0C5FF) : const Color(0xFF5F84FF);

  /// 强调色
  Color get highlight =>
      isDark ? const Color(0xFFFFB4A9) : const Color(0xFFF77866);
}
