import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/style/index.dart';

/// TextFormField 表单 输入框
class TextFormWidget extends StatefulWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final String? labelText;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormWidget({
    Key? key,
    this.controller,
    this.autofocus = false,
    this.labelText,
    this.validator,
    this.isObscure = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  bool _isShowObscureIcon = false;
  @override
  void initState() {
    super.initState();
    _isShowObscureIcon = widget.isObscure!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus!,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: widget.isObscure == true
          ? InputDecoration(
              labelText: widget.labelText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isShowObscureIcon = !_isShowObscureIcon;
                  });
                },
                icon: Icon(
                  _isShowObscureIcon == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 15,
                  color: AppColors.surfaceVariant,
                ),
              ),
            )
          : InputDecoration(
              labelText: widget.labelText,
            ),
      // 校验
      validator: widget.validator,
      // 是否密码
      obscureText: _isShowObscureIcon,
      // 输入格式
      inputFormatters: widget.inputFormatters,
    );
  }
}
