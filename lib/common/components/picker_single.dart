import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// Picker 单选列表
class PickerSingleWidget extends StatelessWidget {
  final Function(KeyValueModel item)? onSelected;
  final String? title;
  final KeyValueModel? value;
  final List<KeyValueModel>? items;

  const PickerSingleWidget({
    Key? key,
    this.onSelected,
    this.title,
    this.value,
    this.items,
  }) : super(key: key);

  _buildView() {
    List<Widget> ws = [
      // 标题
      if (title != null) TextWidget.title3(title!),

      // 选项列表
      if (items != null)
        for (int i = 0; i < items!.length; i++)
          ListTileWidget(
            title: TextWidget.body1(items![i].key),
            trailing: [
              CheckBoxWidget.single(items![i].value == value!.value, (value) {
                if (onSelected != null) {
                  onSelected!(items![i]);
                }
                Get.back();
              })
            ],
          ).paddingBottom(AppSpace.listItem),
    ];

    return ws
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
        )
        .paddingAll(AppSpace.card)
        .decorated(
          color: AppColors.background,
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
        );
    // Container(
    //   padding: EdgeInsets.all(20.w),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(AppTheme.radius.w),
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     mainAxisSize: MainAxisSize.min,
    //     children: ws,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
