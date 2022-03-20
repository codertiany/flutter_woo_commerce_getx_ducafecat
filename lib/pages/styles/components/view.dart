import 'package:flutter/material.dart';
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
        controller.product,
      ).tight(width: 200),
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
