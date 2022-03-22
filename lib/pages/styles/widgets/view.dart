import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class WidgetsPage extends GetView<WidgetsController> {
  const WidgetsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    List<Widget> ws = [
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleButtons),
        title: const TextWidget.body1("按钮"),
      ),
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleInputs),
        title: const TextWidget.body1("输入框"),
      ),
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleTextForm),
        title: const TextWidget.body1("表单输入框"),
      ),
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleGroupList),
        title: const TextWidget.body1("分组按钮"),
      ),
      ListTileWidget(
        onTap: controller.onDialog,
        title: const TextWidget.body1("对话框"),
      ),
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleBottomSheet),
        title: const TextWidget.body1("底部弹出"),
      ),
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleOther),
        title: const TextWidget.body1("其它"),
      ),
      ListTileWidget(
        onTap: () => Get.toNamed(RouteNames.styleComponents),
        title: const TextWidget.body1("业务"),
      ),

      // 主题
      ListTileWidget(
        onTap: controller.onThemeSelected,
        title: TextWidget.body1(
            "主题 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),

      // 多语言
      ListTileWidget(
        onTap: controller.onShowLanguagesBottomSheet,
        title: const TextWidget.body1("多语言"),
      ),
    ];

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
          appBar: AppBar(title: Text(LocaleKeys.stylePageTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
