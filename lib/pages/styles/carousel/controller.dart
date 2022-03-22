import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

class CarouselController extends GetxController {
  CarouselController();

  List<KeyValueModel> imagesList = [
    KeyValueModel(
        key: "01",
        value:
            "https://ducafecat.oss-cn-beijing.aliyuncs.com/flutter_woo_commerce_getx_ducafecat/banner01.png"),
    KeyValueModel(
        key: "01",
        value:
            "https://ducafecat.oss-cn-beijing.aliyuncs.com/flutter_woo_commerce_getx_ducafecat/banner02.png"),
    KeyValueModel(
        key: "01",
        value:
            "https://ducafecat.oss-cn-beijing.aliyuncs.com/flutter_woo_commerce_getx_ducafecat/banner03.png"),
  ];

  int currentIndex = 0;

  void onPageChanged(int val, page) {
    currentIndex = val;
    update(["carousel_home"]);
  }

  _initData() {
    update(["carousel"]);
  }

  void onTap() {}

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
