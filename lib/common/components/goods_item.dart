import 'package:flutter/material.dart';

import '../index.dart';

class GoodsItemWidget extends StatelessWidget {
  final Function()? onTap;
  final WpProduct data;
  final double? width;
  final double? height;

  const GoodsItemWidget(
    this.data, {
    Key? key,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  Widget _buildView() {
    var ws = <Widget>[
      ImageWidget.url(
        data.images?.first.thumbnail,
        fit: BoxFit.cover,
        height: height,
        width: width,
      ),
      TextWidget.body2(data.name ?? "").padding(all: 5),
      TextWidget.body2(
        data.prices?.salePrice ?? "",
        weight: FontWeight.bold,
      ).padding(horizontal: 5, bottom: 5),
    ];
    return ws
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .backgroundColor(AppColors.onPrimary)
        .card();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
