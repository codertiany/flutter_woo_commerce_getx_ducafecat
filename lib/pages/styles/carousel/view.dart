import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class CarouselPage extends GetView<CarouselController> {
  const CarouselPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      // 首页滚动图
      GetBuilder<CarouselController>(
              init: controller,
              id: "carousel_home",
              builder: (_controller) {
                return CarouselWidget(
                  items: _controller.imagesList,
                  currentIndex: _controller.currentIndex,
                  onPageChanged: _controller.onPageChanged,
                  height: 200,
                );
              })
          .tight(height: 200)
          .backgroundColor(Colors.black26)
          .paddingBottom(AppSpace.listRow),

      // 产品页滚动图
      GetBuilder<CarouselController>(
              init: controller,
              id: "carousel_prod",
              builder: (_controller) {
                return CarouselWidget(
                  items: _controller.imagesList,
                  currentIndex: _controller.currentIndex,
                  onPageChanged: _controller.onPageChanged,
                  height: 300,
                  indicatorCircle: false,
                );
              })
          .tight(height: 300)
          .backgroundColor(Colors.black26)
          .paddingBottom(AppSpace.listRow),
    ].toColumn().paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarouselController>(
      init: CarouselController(),
      id: "carousel",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("滚动图")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
