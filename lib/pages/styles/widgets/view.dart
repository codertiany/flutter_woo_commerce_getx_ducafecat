import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/widgets/index.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

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

  // 按钮
  Widget _buildButtons() {
    return <Widget>[
      TextWidget.title1("按钮"),

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

      // 分隔
      const Divider(),

      //
    ].toColumn();
  }

  // 输入框
  Widget _buildInputs() {
    return <Widget>[
      TextWidget.title1("输入框"),

      /// 文本
      InputWidget.text("Man T- Shirt")
          .width(300)
          .paddingBottom(AppSpace.listRow),

      /// 文本 带边框
      InputWidget.textBorder("带边框 > Man T- Shirt")
          .width(300)
          .paddingBottom(AppSpace.listRow),

      /// 文本 填充
      InputWidget.textFilled("填充 > Man T- Shirt")
          .width(300)
          .paddingBottom(AppSpace.listRow),

      /// 图标文本 填充
      InputWidget.iconTextFilled(
          "图标 > Man T- Shirt",
          IconWidget.svg(
            AssetsSvgs.cHomeSvg,
          )).width(300).paddingBottom(AppSpace.listRow),

      /// 后缀图标文本 填充
      InputWidget.suffixTextFilled(
          "后缀图标 > Man T- Shirt",
          IconWidget.svg(
            AssetsSvgs.cHomeSvg,
          )).width(300).paddingBottom(AppSpace.listRow),

      /// 搜索
      InputWidget.search(
        "搜索 > Man T- Shirt",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 选择框
      CheckBoxWidget(
        value: controller.checkVal,
        onChanged: controller.onCheckBox,
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 选择框 all
      CheckBoxWidget.all(
        controller.checkVal,
        controller.onCheckBox,
        label: TextWidget.title3("全选"),
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 选择框 single
      CheckBoxWidget.single(
        controller.checkVal,
        controller.onCheckBox,
        label: TextWidget.title3("行选择"),
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 选择框 radio
      CheckBoxWidget.radio(
        controller.checkVal,
        controller.onCheckBox,
        label: TextWidget.body1("radio"),
      ).width(300).paddingBottom(AppSpace.listRow),

      // 分隔符
      const Divider(),
    ].toColumn();
  }

  // 表单 Text Form
  Widget _buildTextForm() {
    return Form(
        key: controller.formKey, //设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: <Widget>[
          TextWidget.title1("表单 Text Form"),
          TextFormWidget(
            // autofocus: true,
            keyboardType: TextInputType.emailAddress,
            controller: controller.unameController,
            labelText: "email",
            validator: Validatorless.multiple([
              Validatorless.required("The field is obligatory"),
              Validatorless.min(6,
                  "Length cannot be less than @size".trParams({"size": "6"})),
              Validatorless.max(
                  18,
                  "Length cannot be greater than @size"
                      .trParams({"size": "18"})),
              Validatorless.email("The field must be an email"),
            ]),
          ),
          TextFormWidget(
            controller: controller.pwdController,
            labelText: "password",
            isObscure: true,
            validator: Validatorless.multiple([
              Validatorless.required("The field is obligatory"),
              Validatorless.min(6,
                  "Length cannot be less than @size".trParams({"size": "6"})),
              Validatorless.max(
                  18,
                  "Length cannot be greater than @size"
                      .trParams({"size": "18"})),
            ]),
          ),
          ButtonWidget.primary(
            "submit",
            onTap: () {
              if ((controller.formKey.currentState as FormState).validate()) {
                try {} finally {}
              }
            },
          ).tight(width: 100, height: 50),

          // 分隔符
          const Divider(),
        ].toColumn());
  }

  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInputs(),
          _buildButtons(),
          _buildTextForm(),
        ],
      ),
    );
  }
}
