import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../index.dart';

/// 滚动视图
class CarouselWidget extends StatelessWidget {
  const CarouselWidget(
      {Key? key,
      this.onPageChanged,
      this.onTap,
      required this.items,
      this.currentIndex,
      this.height,
      this.indicatorColor,
      this.indicatorCircle,
      this.indicatorAlignment,
      this.indicatorLeft,
      this.indicatorRight,
      this.indicatorBottom})
      : super(key: key);

  /// 切换页码
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  /// 点击
  final Function(KeyValueModel)? onTap;

  /// 数据列表
  final List<KeyValueModel> items;

  /// 当前选中
  final int? currentIndex;

  /// 高度
  final double? height;

  /// 指示器 颜色
  final Color? indicatorColor;

  /// 指示器 是否圆形
  final bool? indicatorCircle;

  /// 指示器 对齐方式
  final MainAxisAlignment? indicatorAlignment;

  /// 指示器 位置
  final double? indicatorLeft, indicatorRight, indicatorBottom;

  Widget _buildView() {
    List<Widget> ws = [
      CarouselSlider(
        options: CarouselOptions(
          height: height,
          viewportFraction: 1,
          aspectRatio: 3.2 / 1,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          autoPlay: true,
          onPageChanged: onPageChanged,
        ),
        items: <Widget>[
          for (var i = 0; i < items.length; i++)
            ImageWidget.url(
              items[i].value,
              fit: BoxFit.fill,
            ).onTap(
              () {
                if (onTap != null) onTap!(items[i].value);
              },
            ),
        ],
      ),
      SliderIndicatorWidget(
        length: items.length,
        currentIndex: currentIndex ?? 0,
        color: indicatorColor ?? AppColors.background,
        isCircle: indicatorCircle ?? true,
        alignment: indicatorAlignment ?? MainAxisAlignment.center,
      ).positioned(
        left: indicatorLeft ?? 20,
        right: indicatorRight ?? 20,
        bottom: indicatorBottom ?? 10,
      ),
    ];

    return ws.toStack();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
