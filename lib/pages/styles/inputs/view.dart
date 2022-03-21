import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildInputs().center(),
    );
  }

  Widget _buildInputs() {
    return <Widget>[
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
        label: const TextWidget.title3("全选"),
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 选择框 single
      CheckBoxWidget.single(
        controller.checkVal,
        controller.onCheckBox,
        label: const TextWidget.title3("行选择"),
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 选择框 radio
      CheckBoxWidget.radio(
        controller.checkVal,
        controller.onCheckBox,
        label: const TextWidget.body1("radio"),
      ).width(300).paddingBottom(AppSpace.listRow),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputsController>(
      init: InputsController(),
      id: "inputs",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("输入框")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
