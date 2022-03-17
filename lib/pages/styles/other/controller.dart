import 'package:get/get.dart';

class OtherController extends GetxController {
  OtherController();

  final List<double> priceRange = [20, 500];

  // 价格修改
  onPriceRangeDragging(
      int handlerIndex, dynamic lowerValue, dynamic upperValue) {
    priceRange[0] = double.parse(lowerValue.toString());
    priceRange[1] = double.parse(upperValue.toString());
    update(["filterView"]);
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
