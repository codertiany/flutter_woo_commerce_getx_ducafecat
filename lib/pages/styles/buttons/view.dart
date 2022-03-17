import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class ButtonsPage extends GetView<ButtonsController> {
  const ButtonsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return <Widget>[
      // 1 文字按钮
      ButtonWidget.text(
        "文字按钮",
        textSize: 15.sp,
      ).paddingBottom(AppSpace.listRow),

      // 2 图标按钮
      ButtonWidget.icon(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
      ).paddingBottom(AppSpace.listRow),

      // 3 图标文字按钮
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        iconTextSpace: 5.w,
      ).paddingBottom(AppSpace.listRow),

      // 3 图标文字按钮 - 边框
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        iconTextSpace: 5.w,
        borderColor: Get.theme.colorScheme.outline.withOpacity(0.2),
      ).height(40).width(120).paddingBottom(AppSpace.listRow),

      // 4 图标文字按钮 - 反转
      ButtonWidget.iconText(
        IconWidget.icon(
          Icons.navigate_next,
          size: 24.sp,
          color: Colors.purple.shade300,
        ),
        "All",
        iconTextSpace: 0,
        textDirection: TextDirection.rtl,
      ).paddingBottom(AppSpace.listRow),

      // 5 图标文字按钮 - 纵向
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        isColumn: true,
      ).paddingBottom(AppSpace.listRow),

      // primary 主按钮
      ButtonWidget.primary(
        "Buy Now",
      ).height(50.w).paddingBottom(AppSpace.listRow),

      // primary 主按钮
      ButtonWidget.primary(
        "Buy Now",
        icon: IconWidget.svg(AssetsSvgs.cBagSvg),
      ).height(50.w).width(200.w).paddingBottom(AppSpace.listRow),

      // secondary 主按钮
      ButtonWidget.secondary(
        "Add To Cart",
        icon: IconWidget.image(AssetsImages.pCashPng),
      ).height(50.w).width(200.w).paddingBottom(AppSpace.listRow),

      // 文字/填充 按钮
      ButtonWidget.textFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
        textSize: 12.sp,
      ).height(30).width(45).paddingBottom(AppSpace.listRow),

      // 文字/填充/圆形 按钮
      ButtonWidget.textRoundFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: 12.w,
        textSize: 9.sp,
      ).tight(width: 24.w, height: 24.w).paddingBottom(AppSpace.listRow),

      //
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonsController>(
      init: ButtonsController(),
      id: "buttons",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("按钮")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
