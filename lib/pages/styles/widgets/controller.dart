import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

class WidgetsController extends GetxController {
  WidgetsController();

  _initData() {
    update(["widgets"]);
  }

  // 样式
  List<KeyValueModel> themes = [
    KeyValueModel(key: "Light", value: "light"),
    KeyValueModel(key: "Dark", value: "dack"),
  ];
  onThemeSelected() async {
    await ConfigService.to.switchThemeModel();
    update(["widgets"]);
  }

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

  // @override
  // void onInit() {
  //   super.onInit();
  // }

}
