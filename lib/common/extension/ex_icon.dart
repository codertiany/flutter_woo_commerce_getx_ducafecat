part of 'index.dart';

extension ExIcon<T extends Icon> on T {
  T copyWith({
    double? size,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) =>
      Icon(
        icon,
        color: color ?? this.color,
        size: size ?? this.size,
        semanticLabel: semanticLabel ?? this.semanticLabel,
        textDirection: textDirection ?? this.textDirection,
      ) as T;

  T iconSize(double size) => copyWith(size: size);

  T iconColor(Color color) => copyWith(color: color);
}
