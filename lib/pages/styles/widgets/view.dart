import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class WidgetsPage extends GetView<WidgetsController> {
  WidgetsPage({Key? key}) : super(key: key);
  final List<Widget> ws = [
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleButtons),
      title: TextWidget.body1("按钮"),
    ),
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleInputs),
      title: TextWidget.body1("输入框"),
    ),
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleTextForm),
      title: TextWidget.body1("文字表单"),
    ),
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleGroupList),
      title: TextWidget.body1("分组按钮"),
    ),
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleBottomSheet),
      title: TextWidget.body1("底部弹出"),
    ),
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleOther),
      title: TextWidget.body1("其它"),
    ),
    ListTileWidget(
      onTap: () => Get.toNamed(RouteNames.styleComponents),
      title: TextWidget.body1("业务"),
    ),
    ListTileWidget(
      title: TextWidget.body1("样式theme"),
    ),
    ListTileWidget(
      title: TextWidget.body1("多语言"),
    ),
  ];

  Widget _buildView() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int pos) {
        var item = ws[pos];
        return item;
      },
      separatorBuilder: (BuildContext context, int pos) {
        return const Divider();
      },
      itemCount: ws.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WidgetsController>(
      init: WidgetsController(),
      id: "widgets",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("样式&功能&调试")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
