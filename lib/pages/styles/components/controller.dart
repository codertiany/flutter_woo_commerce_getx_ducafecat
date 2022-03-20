import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

class ComponentsController extends GetxController {
  ComponentsController();

  WpProduct product = WpProduct(
    name:
        "Amazon Basics Kids Unicorns & Rainbows Patterned Throw Blanket with Stuffed Animal Unicorn",
    images: [
      WpProductionImages(
        thumbnail:
            "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/e12b8a142351704bf95cce1ec78936d6.jpg",
      ),
    ],
    prices: WpProductPrices(salePrice: "99.99"),
  );

  _initData() {
    update(["components"]);
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
