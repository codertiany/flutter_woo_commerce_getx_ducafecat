import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

/// 业务组件
class ComponentsPage extends GetView<ComponentsController> {
  const ComponentsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      // 商品项
      GoodsItemWidget(
        imgUrl:
            "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/e12b8a142351704bf95cce1ec78936d6.jpg",
        // imgWidth: 120.w,
        imgHeight: 117.w,
        title:
            "Amazon Basics Kids Unicorns & Rainbows Patterned Throw Blanket with Stuffed Animal Unicorn",
        price: "99.99",
      ).tight(width: 120.w, height: 170.w).paddingBottom(AppSpace.listRow),

      // 商品项
      GoodsItemWidget(
        imgUrl:
            "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/e12b8a142351704bf95cce1ec78936d6.jpg",
        // imgWidth: 132.w,
        imgHeight: 114.w,
        title:
            "Amazon Basics Kids Unicorns & Rainbows Patterned Throw Blanket with Stuffed Animal Unicorn",
        // price: "99.99",
      ).tight(width: 132.w, height: 155.w).paddingBottom(AppSpace.listRow),
    ].toColumn().center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComponentsController>(
      init: ComponentsController(),
      id: "components",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("components")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
