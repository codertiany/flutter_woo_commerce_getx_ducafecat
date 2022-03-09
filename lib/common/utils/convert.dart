import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum NumberUnitType {
  distance,
  number,
}

// 性别类型
const genderTypeLady = 'lady';
const genderTypeGentleman = 'gentleman';
const genderTypeSecret = 'secret';

class Convert {
  static bool toBool(String? value) {
    // return value != null && value.isNotEmpty && value != '0';
    return value == '1';
  }

  static String toGender(String? value) {
    switch (value) {
      case genderTypeLady:
        return 'Lady';
      case genderTypeGentleman:
        return 'Gentleman';
      case genderTypeSecret:
        return 'Secret';
      default:
        return '';
    }
  }

  static int toAge(String? value) {
    if (value == null || value.isEmpty) return 0;
    final birthday = toDateTime(value);
    final now = DateTime.now();
    final day = now.difference(birthday).inDays;
    final years = day / 360;
    return years >= 1 ? years.toInt() : 0;
  }

  static DateTime toDateTime(String value, [String format = 'yyyy-MM-dd']) {
    if (value.isEmpty) return DateTime.now();
    return DateFormat(format).parse(value);
  }

  static String toDateFormat(DateTime value, [String format = 'yyyy-MM-dd']) {
    return DateFormat(format).format(value);
  }

  static String toNumberUnit(num value,
      [NumberUnitType type = NumberUnitType.number]) {
    var _value = value;
    var _unit = '';
    switch (type) {
      case NumberUnitType.number:
        if (_value > 1000 && _value < 1000000) {
          _value = _value / 1000;
          _unit = 'k';
        }
        if (_value >= 1000000) {
          _value = _value / 1000000;
          _unit = 'm';
        }
        break;
      case NumberUnitType.distance:
        _unit = 'm';
        if (_value > 1609.344) {
          _value = _value / 1609.344;
          _unit = 'mile';
        }
        /*if (_value >= 10000000) {
          _value = _value / 10000000;
          _unit = 'wkm';
        }*/
        break;
    }
    return _value.toStringAsFixed(_value is int ? 0 : 1) + _unit;
  }

  /// 字符串转 Color 类型
  /// Color color = stringToColor("40c254");
  Color stringToColor(String source) {
    return Color(int.parse(source, radix: 16) | 0xFF000000);
  }

  /// 字符串转 MaterialColor
  /// MaterialColor materialColor = stringToMaterialColor("40c254");
  MaterialColor stringToMaterialColor(String source) {
    Color color = stringToColor(source);

    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
