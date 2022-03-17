import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';

import '../extension/index.dart';
import '../style/index.dart';
import 'index.dart';

class PriceRangeWidget extends StatelessWidget {
  final List<double>? values; // [0, 0]
  final Function(int, dynamic, dynamic)? onDragging;
  final double? max;
  final double? min;

  const PriceRangeWidget({
    Key? key,
    this.values,
    this.onDragging,
    this.max = 99999,
    this.min = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        <Widget>[
          TextWidget.body3(
            "\$${values?[0]}",
            color: AppColors.secondary,
          ),
          const Spacer(),
          TextWidget.body3(
            "\$${values?[1]}",
            color: AppColors.secondary,
          ),
        ].toRow(),
        FlutterSlider(
          values: values!,
          rangeSlider: true,
          max: max,
          min: min,
          handlerHeight: 6,
          handlerWidth: 6,
          // 滑块颜色
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: AppColors.highlight,
            ),
            inactiveTrackBar: BoxDecoration(
              color: AppColors.surfaceVariant.withOpacity(0.5),
            ),
          ),
          // 提示
          tooltip: FlutterSliderTooltip(
            leftPrefix: Icon(
              Icons.attach_money,
              size: 19,
              color: AppColors.surfaceVariant.withOpacity(0.5),
            ),
            rightSuffix: Icon(
              Icons.attach_money,
              size: 19,
              color: AppColors.surfaceVariant.withOpacity(0.5),
            ),
          ),
          // 左侧滑块
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.highlight,
                borderRadius: const BorderRadius.all(
                  Radius.circular(3),
                ),
                border: Border.all(
                  color: AppColors.highlight,
                  width: 1,
                ),
              ),
            ),
          ),
          // 右侧滑块
          rightHandler: FlutterSliderHandler(
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.highlight,
                borderRadius: const BorderRadius.all(
                  Radius.circular(3),
                ),
                border: Border.all(
                  color: AppColors.highlight,
                  width: 1,
                ),
              ),
            ),
          ),
          onDragging: onDragging,
        ),
      ],
    );
  }
}
