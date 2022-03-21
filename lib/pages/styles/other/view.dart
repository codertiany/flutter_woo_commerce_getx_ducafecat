import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

      // 横向 状态条
      const <Widget>[
        StepHorizontalItem(
          statusName: "Pending",
          status: StepStatus.success,
        ),
        StepHorizontalItem(
          statusName: "Confirmed",
          status: StepStatus.success,
        ),
        StepHorizontalItem(
          statusName: "Processing",
          status: StepStatus.running,
        ),
        StepHorizontalItem(
          statusName: "Picked",
          status: StepStatus.none,
        ),
        StepHorizontalItem(
          statusName: "Shipped",
          status: StepStatus.none,
        ),
        StepHorizontalItem(
          statusName: "Delivered",
          status: StepStatus.none,
        ),
      ].toRow().paddingBottom(AppSpace.listRow),

      // 纵向 状态条
      const <Widget>[
        StepVerticalItem(
          statusName: "Delivered",
          statusDateTime: "20 Jan, 2019",
          statusDes:
              "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
          status: StepStatus.none,
        ),
        StepVerticalItem(
          statusName: "Shipped",
          statusDateTime: "20 Jan, 2019",
          statusDes:
              "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
          status: StepStatus.none,
        ),
        StepVerticalItem(
          statusName: "Picked",
          statusDateTime: "20 Jan, 2019",
          statusDes:
              "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
          status: StepStatus.running,
        ),
        StepVerticalItem(
          statusName: "Processing",
          statusDateTime: "20 Jan, 2019",
          statusDes:
              "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
          status: StepStatus.success,
        ),
        StepVerticalItem(
          statusName: "Confirm",
          statusDateTime: "20 Jan, 2019",
          statusDes:
              "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
          status: StepStatus.success,
        ),
        StepVerticalItem(
          statusName: "Pending",
          statusDateTime: "20 Jan, 2019",
          statusDes:
              "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
          status: StepStatus.success,
        ),
      ].toColumn().paddingBottom(AppSpace.listRow),

      // ListTile
      ListTileWidget(
        crossAxisAlignment: CrossAxisAlignment.start,
        // 左侧按钮
        leading: CheckBoxWidget.radio(
          controller.radioValue,
          controller.onChangeRadioValue,
          fontColor: AppColors.button,
        ),
        // 标题
        title: const TextWidget.title3("Los Angeles, USA"),
        subtitle: const TextWidget.body2(
          "817-234-8827",
          weight: FontWeight.w300,
        ),
        description: const TextWidget.body2(
          "4008 Loving Acres Road",
          weight: FontWeight.w300,
        ),
        // 右侧按钮
        trailing: <Widget>[
          ButtonWidget.icon(IconWidget.icon(
            Icons.edit,
            size: 15,
            color: AppColors.surfaceVariant,
          )),
          ButtonWidget.icon(IconWidget.icon(
            Icons.delete,
            size: 15,
            color: AppColors.surfaceVariant,
          )),
        ],
      ).height(100.h).decorated(
        color: AppColors.background,
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 7),
            color: AppColors.outline.withOpacity(0.15),
            blurRadius: 18.0,
            spreadRadius: 0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ).paddingBottom(AppSpace.listRow)

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
