import 'package:flutter/foundation.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
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

  // 性别
  List<KeyValueModel> genders = [
    KeyValueModel(key: "Lady", value: "Lady"),
    KeyValueModel(key: "Gentleman", value: "Gentleman"),
    KeyValueModel(key: "Secret", value: "Secret"),
  ];
  KeyValueModel? genderValue = KeyValueModel(key: "Secret", value: "Secret");
  onGenderSelected(KeyValueModel item) {
    genderValue = item;
    update(["bottom_sheet"]);
  }

  // 生日
  DateTime birthday = DateTime.now();
  onBirthdayConfirm(DateTime val) {
    birthday = val;
    update(["bottom_sheet"]);
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
