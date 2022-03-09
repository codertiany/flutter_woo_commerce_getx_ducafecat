part of 'index.dart';

extension ExWidget on Widget {
  /// 内间距
  Widget padding({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(
          top: top ?? vertical ?? all ?? 0.0,
          bottom: bottom ?? vertical ?? all ?? 0.0,
          left: left ?? horizontal ?? all ?? 0.0,
          right: right ?? horizontal ?? all ?? 0.0,
        ),
        child: this,
      );

  /// 内间距 上
  Widget paddingTop(double val) => padding(top: val);

  /// 内间距 下
  Widget paddingBottom(double val) => padding(bottom: val);

  /// 内间距 左
  Widget paddingLeft(double val) => padding(left: val);

  /// 内间距 右
  Widget paddingRight(double val) => padding(right: val);

  /// 内间距 横向
  Widget paddingHorizontal(double val) => padding(horizontal: val);

  /// 内间距 纵向
  Widget paddingVertical(double val) => padding(vertical: val);

  Widget opacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
  }) =>
      Opacity(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: this,
      );

  Widget offstage({
    Key? key,
    bool offstage = true,
  }) =>
      Offstage(
        key: key,
        offstage: offstage,
        child: this,
      );

  Widget align(
    AlignmentGeometry alignment, {
    Key? key,
  }) =>
      Align(
        key: key,
        alignment: alignment,
        child: this,
      );
  Widget alignCenter() => align(Alignment.center);
  Widget alignLeft() => align(Alignment.centerLeft);
  Widget alignRight() => align(Alignment.centerRight);

  Widget backgroundColor(
    Color color, {
    Key? key,
  }) =>
      DecoratedBox(
        key: key,
        child: this,
        decoration: BoxDecoration(color: color),
      );

  Widget backgroundImage(
    DecorationImage image, {
    Key? key,
  }) =>
      DecoratedBox(
        key: key,
        child: this,
        decoration: BoxDecoration(image: image),
      );

  Widget decorated({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
  }) {
    BoxDecoration decoration = BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return DecoratedBox(
      key: key,
      child: this,
      decoration: decoration,
      position: position,
    );
  }

  Widget boxShadow({
    Key? key,
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
  }) {
    BoxDecoration decoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
    return DecoratedBox(
      key: key,
      child: this,
      decoration: decoration,
    );
  }

  Widget border({
    Key? key,
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
  }) {
    BoxDecoration decoration = BoxDecoration(
      border: Border(
        left: (left ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: left ?? all ?? 0, style: style),
        right: (right ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: right ?? all ?? 0, style: style),
        top: (top ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: top ?? all ?? 0, style: style),
        bottom: (bottom ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
      ),
    );
    return DecoratedBox(
      key: key,
      child: this,
      decoration: decoration,
    );
  }

  Widget borderRadius({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? all ?? 0.0),
        topRight: Radius.circular(topRight ?? all ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
      ),
    );
    return DecoratedBox(
      key: key,
      child: this,
      decoration: decoration,
    );
  }

  Widget elevation(
    double elevation, {
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color shadowColor = const Color(0xFF000000),
  }) =>
      Material(
        key: key,
        child: this,
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
      );
}
