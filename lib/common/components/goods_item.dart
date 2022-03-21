import 'package:flutter/material.dart';

import '../index.dart';

/// 商品展示项
class GoodsItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String? imgUrl;
  final double? imgWidth;
  final double? imgHeight;
  final String? title;
  final String? price;

  const GoodsItemWidget({
    Key? key,
    this.onTap,
    this.imgUrl,
    this.imgWidth,
    this.imgHeight,
    this.title,
    this.price,
  }) : super(key: key);

  Widget _buildView(BoxConstraints constraints) {
    var ws = <Widget>[
      // 图片
      if (imgUrl != null)
        ImageWidget.url(
          imgUrl,
          fit: BoxFit.cover,
          width: imgWidth ?? constraints.minWidth,
          height: imgHeight,
        ),

      // 描述
      <Widget>[
        // 标题
        if (title != null) TextWidget.body2(title ?? ""),

        // 价格
        if (price != null)
          TextWidget.body2(
            price ?? "",
            weight: FontWeight.bold,
          ),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(all: AppSpace.listItem)
          .expanded(),
    ];

    return ws
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        // .backgroundColor(AppColors.onPrimary)
        .card();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _buildView(constraints);
      },
    );
  }
}
