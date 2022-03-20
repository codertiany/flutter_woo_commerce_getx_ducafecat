import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class BottomSheetController extends GetxController {
  BottomSheetController();

  _initData() {
    update(["bottom_sheet"]);
  }

  // 拍照
  onTapTake(AssetEntity? result) {
    if (kDebugMode) {
      print(result);
    }
  }

  // 相册
  onTapAlbum(List<AssetEntity>? result) {
    if (kDebugMode) {
      print(result);
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
