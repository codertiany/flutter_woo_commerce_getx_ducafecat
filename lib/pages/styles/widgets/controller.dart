import 'package:get/get.dart';

class WidgetsController extends GetxController {
  WidgetsController();

  _initData() {
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
