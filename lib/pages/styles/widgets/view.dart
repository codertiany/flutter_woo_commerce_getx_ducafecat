import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/widgets/index.dart';
import 'package:get/get.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/extension/index.dart';

import 'index.dart';

class WidgetsPage extends GetView<WidgetsController> {
  const WidgetsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return <Widget>[
      // 主按钮
      ButtonWidget.primary(
        "Buy Now",
      ).height(50.w),
      const Divider(),

      // 主按钮
      ButtonWidget.primary(
        "Buy Now",
        icon: IconWidget.svg(AssetsSvgs.cBagSvg),
      ).height(50.w).width(200.w),
      const Divider(),

      // 主按钮
      ButtonWidget.secondary(
        "Add To Cart",
        icon: IconWidget.image(AssetsImages.pCashPng),
      ).height(50.w).width(200.w),
      const Divider(),

      // 文字按钮
      ButtonWidget.text(
        "文字按钮",
        textSize: 15.sp,
        textWeight: FontWeight.w500,
      ),
      const Divider(),

      //
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WidgetsController>(
      init: WidgetsController(),
      id: "widgets",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
