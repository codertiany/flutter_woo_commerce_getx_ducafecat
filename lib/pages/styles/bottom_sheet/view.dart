import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class BottomSheetPage extends GetView<BottomSheetController> {
  const BottomSheetPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      // 拍照
      ListTileWidget(
        title: const TextWidget.body1("拍照、相册"),
        onTap: () {
          ActionBottomSheet.showMaterialModal(
            context: Get.context,
            child: PickerImageWidget(
              onTapTake: controller.onTapTake,
              onTapAlbum: controller.onTapAlbum,
            ),
          );
        },
      ),

      // 性别
      ListTileWidget(
        title: TextWidget.body1("Genders : ${controller.genderValue?.value}"),
        onTap: () {
          ActionBottomSheet.showMaterialModal(
            context: Get.context,
            child: PickerSingleWidget(
              title: "Genders",
              value: controller.genderValue,
              items: controller.genders,
              onSelected: controller.onGenderSelected,
            ),
          );
        },
      ),

      // 生日
      ListTileWidget(
        title: TextWidget.body1(
            "Birthday : ${controller.birthday.toDateString()}"),
        onTap: () {
          ActionBottomSheet.show(
            context: Get.context,
            child: PickerDateTimeWidget(
              title: "Birthday",
              value: controller.birthday,
              maxValue: DateTime.now(),
              onConfirm: controller.onBirthdayConfirm,
            ),
          );
        },
      ),

      // end
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(
      init: BottomSheetController(),
      id: "bottom_sheet",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("底部弹出")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
