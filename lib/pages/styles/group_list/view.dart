import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class GroupListPage extends GetView<GroupListController> {
  const GroupListPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildGroupList().paddingAll(AppSpace.card),
    );
  }

  Widget _buildGroupList() {
    return <Widget>[
      // 尺寸
      GroupListWidget.sizes(
        itemList: controller.sizes,
        values: controller.sizeValues,
        size: 24.w,
        onTap: controller.onSizeCange,
      ).paddingBottom(AppSpace.listRow),

      // 颜色
      GroupListWidget.colors(
        itemList: controller.colors,
        values: controller.colorValues,
        size: 24.w,
        onTap: controller.onColorCange,
      ).paddingBottom(AppSpace.listRow),

      // 标签
      GroupListWidget.tags(
        itemList: controller.tags,
        values: controller.tagValues,
        onTap: controller.onTagCange,
      ).paddingBottom(AppSpace.listRow),

      // 星级
      GroupListWidget.stars(
        starNum: controller.starNum,
        value: controller.starValue,
        onTap: controller.onStarCange,
      ).paddingBottom(AppSpace.listRow),

      const Divider(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupListController>(
      init: GroupListController(),
      id: "group_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("分组列表")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
