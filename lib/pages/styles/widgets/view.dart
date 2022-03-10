import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/widgets/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class WidgetsPage extends GetView<WidgetsController> {
  const WidgetsPage({Key? key}) : super(key: key);

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

  Widget _buildButtons() {
    return <Widget>[
      // 1 文字按钮
      ButtonWidget.text(
        "文字按钮",
        textSize: 15.sp,
      ),
      const Divider(),

      // 2 图标按钮
      ButtonWidget.icon(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
      ),
      const Divider(),

      // 3 图标文字按钮
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        iconTextSpace: 5.w,
      ),
      const Divider(),

      // 3 图标文字按钮 - 边框
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        iconTextSpace: 5.w,
        borderColor: Get.theme.colorScheme.outline.withOpacity(0.2),
      ).height(40).width(120),
      const Divider(),

      // 4 图标文字按钮 - 反转
      ButtonWidget.iconText(
        IconWidget(
          iconData: Icons.navigate_next,
          size: 24.sp,
          color: Colors.purple.shade300,
        ),
        "All",
        iconTextSpace: 0,
        textDirection: TextDirection.rtl,
      ),
      const Divider(),

      // 5 图标文字按钮 - 纵向
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30.sp,
        ),
        "Home",
        isColumn: true,
      ),
      const Divider(),

      // primary 主按钮
      ButtonWidget.primary(
        "Buy Now",
      ).height(50.w),
      const Divider(),

      // primary 主按钮
      ButtonWidget.primary(
        "Buy Now",
        icon: IconWidget.svg(AssetsSvgs.cBagSvg),
      ).height(50.w).width(200.w),
      const Divider(),

      // secondary 主按钮
      ButtonWidget.secondary(
        "Add To Cart",
        icon: IconWidget.image(AssetsImages.pCashPng),
      ).height(50.w).width(200.w),
      const Divider(),

      // 文字/填充 按钮
      ButtonWidget.textFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
        textSize: 12.sp,
      ).height(30).width(45),
      const Divider(),

      // 文字/填充/圆形 按钮
      ButtonWidget.textRoundFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: 12.w,
        textSize: 9.sp,
      ).tight(width: 24.w, height: 24.w),
      const Divider(),

      //
    ].toColumn();
  }

  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          _buildButtons(),
        ],
      ),
    );
  }
}
