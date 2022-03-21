import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

/// Picker 日期选择
class PickerDateTimeWidget extends StatelessWidget {
  final String? title;
  final DateTime? value;
  final DateTime? minValue;
  final DateTime? maxValue;
  final int type;
  final Function(DateTime value)? onConfirm;

  const PickerDateTimeWidget({
    Key? key,
    this.onConfirm,
    this.title,
    this.value,
    this.minValue,
    this.maxValue,
    this.type = PickerDateTimeType.kYMD,
  }) : super(key: key);

  _buildView() {
    var format = 'yyyy-MM-dd';
    var picker = ActionPicker.text(
      adapter: DateTimePickerAdapter(
        type: type,
        isNumberMonth: true,
        minValue: minValue,
        maxValue: maxValue,
        value: value,
      ),
    );
    if (type == PickerDateTimeType.kYMDHM) format = 'yyyy-MM-dd HH:mm';

    List<Widget> ws = [
      // 头部
      <Widget>[
        // 标题
        TextWidget.title3(title ?? "").expanded(),
        // 按钮
        ButtonWidget.text(
          LocaleKeys.commonBottomConfirm.tr,
          textColor: AppColors.primary,
          onTap: () {
            picker.doConfirm(Get.context!);
            if (onConfirm != null) {
              onConfirm!(Convert.toDateTime(picker.adapter.text, format));
            }
          },
        ),
      ].toRow(),

      // 日期选取
      picker.makePicker(),
    ];

    return ws
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
        )
        .paddingAll(AppSpace.card)
        .backgroundColor(AppColors.background);
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
