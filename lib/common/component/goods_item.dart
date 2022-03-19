import 'package:flutter/material.dart';

import '../models/index.dart';

class GoodsItemWidget extends StatelessWidget {
  final WpProduct data;
  final Function()? onTap;

  const GoodsItemWidget(
    this.data, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  Widget _buildView() {
    var ws = <Widget>[
      ImageNetworkWidget(
        url: cover,
        radius: 0,
        width: width,
        height: height,
        fit: BoxFit.cover,
      )
    ];
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
