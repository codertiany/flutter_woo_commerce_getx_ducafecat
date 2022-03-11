import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extension/index.dart';
import '../style/index.dart';
import 'index.dart';

/// 输入框
class InputWidget extends StatelessWidget {
  /// 事件 - 提交
  final Function(String)? onSubmitted;

  /// 事件 - tap
  final Function()? onTap;

  /// 输入控制器
  final TextEditingController? controller;

  /// 焦点
  final FocusNode? focusNode;

  /// 输入框提示文字
  final String? hintText;

  /// 键盘类型
  final TextInputType? keyboardType;

  /// 边框
  final bool? isBorder;

  /// 圆角
  final double? borderRadius;

  /// 密码
  final bool isObscureText;

  /// 只读
  final bool readOnly;

  /// 最大行数
  final int? maxLines;

  /// 最小行数
  final int? minLines;

  /// 字体
  final double? fontSize;

  /// 图标
  final Widget? icon;
  final Widget? suffixIcon;

  /// 输入框确认操作方式
  final TextInputAction? textInputAction;

  /// 输入验证
  final List<TextInputFormatter>? inputFormatters;

  /// 填充颜色
  final Color? fillColor;

  /// 边框颜色
  final Color? borderColor;

  /// 内容 padding
  final EdgeInsetsGeometry? contentPadding;

  const InputWidget({
    Key? key,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isBorder,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.fillColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  /// 文本输入 - 图标文本填充
  InputWidget.iconTextFilled(
    String text,
    this.icon, {
    Key? key,
    this.isBorder = true, // 有边框
    Color? fillColor, // 输入颜色
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
  })  : controller = TextEditingController(text: text),
        fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  /// 搜索
  InputWidget.search(
    String text, {
    Key? key,
    this.isBorder = true, // 有边框
    Color? fillColor, // 输入颜色
    Widget? icon,
    Widget? suffixIcon,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.contentPadding,
    this.borderColor,
    this.borderRadius = 11,
  })  : controller = TextEditingController(text: text),
        icon = icon ??
            IconWidget.icon(
              Icons.search,
              color: AppColors.outline,
            ),
        suffixIcon = <Widget>[
          Container(
            width: 1,
            height: 16,
            color: AppColors.surfaceVariant,
          ).paddingRight(AppSpace.iconTextSmail),
          suffixIcon ??
              IconWidget.icon(
                Icons.photo_camera,
                color: AppColors.outline,
              )
        ].toRow().width(30),
        fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  /// 文本输入 - 后缀图标文本填充
  InputWidget.suffixTextFilled(
    String text,
    this.suffixIcon, {
    Key? key,
    this.isBorder = true, // 有边框
    Color? fillColor, // 输入颜色
    this.icon,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
  })  : controller = TextEditingController(text: text),
        fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  /// 文本输入
  InputWidget.text(
    String text, {
    Key? key,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isBorder,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.fillColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
  })  : controller = TextEditingController(text: text),
        super(key: key);

  /// 文本输入 - 边框
  InputWidget.textBorder(
    String text, {
    Key? key,
    this.isBorder = true, // 有边框
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.fillColor,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
  })  : controller = TextEditingController(text: text),
        super(key: key);

  /// 文本输入 - 填充
  InputWidget.textFilled(
    String text, {
    Key? key,
    this.isBorder = true, // 有边框
    Color? fillColor, // 输入颜色
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputAction,
    this.fontSize,
    this.inputFormatters,
    this.suffixIcon,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
  })  : controller = TextEditingController(text: text),
        fillColor = fillColor ?? AppColors.surface.withOpacity(0.5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var _border = isBorder == true
        ? OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? AppColors.surfaceVariant),
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRadius.input)),
          )
        : InputBorder.none;
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      autocorrect: false,
      obscureText: isObscureText,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      style: AppTextStyles.bodyText1?.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: fillColor ?? Colors.transparent,
        prefixIcon: icon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 0,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 0,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.bodyText2?.copyWith(
          fontWeight: FontWeight.w300,
          color: AppColors.secondary.withOpacity(0.5),
        ),
        contentPadding: contentPadding ?? AppSpace.input,
        isCollapsed: true,
        isDense: true,
        filled: true,
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        focusedErrorBorder: _border,
        disabledBorder: _border,
      ),
    );
  }
}
