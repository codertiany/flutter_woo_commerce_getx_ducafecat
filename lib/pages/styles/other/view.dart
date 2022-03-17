import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class OtherPage extends GetView<OtherController> {
  const OtherPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildOther().padding(all: AppSpace.page),
    );
  }

  Widget _buildOther() {
    return <Widget>[
      // 加个区间
      PriceRangeWidget(
        max: 5000,
        values: controller.priceRange,
        onDragging: controller.onPriceRangeDragging,
      ).paddingBottom(AppSpace.listRow),

      // 数量编辑
      QuantityWidget(
        onChange: controller.onQuantityChange,
        quantity: controller.quantity,
      ).paddingBottom(AppSpace.listRow),

      // 横向进度条
      const <Widget>[
        StepRowItem(
          stateName: "Pending",
          status: StepStatus.success,
        ),
        StepRowItem(
          stateName: "Confirmed",
          status: StepStatus.success,
        ),
        StepRowItem(
          stateName: "Processing",
          status: StepStatus.running,
        ),
        StepRowItem(
          stateName: "Picked",
          status: StepStatus.none,
        ),
        StepRowItem(
          stateName: "Shipped",
          status: StepStatus.none,
        ),
        StepRowItem(
          stateName: "Delivered",
          status: StepStatus.none,
        ),
      ].toRow().paddingBottom(AppSpace.listRow),

      // end
    ].toColumn().center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherController>(
      init: OtherController(),
      id: "other",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("其它")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
