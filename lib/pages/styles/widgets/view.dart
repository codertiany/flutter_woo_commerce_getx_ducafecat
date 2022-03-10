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
      ),
      const Divider(),

      // 图标按钮
      ButtonWidget.icon(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
      ),
      const Divider(),

      // 图标文字按钮
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        iconTextSpace: 5.w,
      ),
      const Divider(),

      // 图标文字按钮 - 反转
      ButtonWidget.iconText(
        IconWidget(
          iconData: Icons.home,
          size: 30.sp,
          color: Colors.purple.shade300,
        ),
        "Home",
        iconTextSpace: 5,
        reversed: true,
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
