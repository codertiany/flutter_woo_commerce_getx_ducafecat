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
        title: TextWidget.body1("拍照、相册"),
        onTap: () {
          ActionBottomSheet.materialModal(
            context: Get.context,
            child: PickerImageWidget(
              onTapTake: controller.onTapTake,
              onTapAlbum: controller.onTapAlbum,
            ),
          );
        },
      ),
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