import 'package:get/get.dart';

class OtherController extends GetxController {
  OtherController();

  // 价格
  final List<double> priceRange = [20, 500];
  onPriceRangeDragging(
      int handlerIndex, dynamic lowerValue, dynamic upperValue) {
    priceRange[0] = double.parse(lowerValue.toString());
    priceRange[1] = double.parse(upperValue.toString());
    update(["other"]);
  }

  // 数量
  int quantity = 1;
  void onQuantityChange(int val) {
    quantity = val;
    update(["other"]);
  }

  _initData() {
    update(["other"]);
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
