import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../index.dart';

/// 状态枚举
enum StepStatus {
  none,
  running,
  success,
}

/// 横向状态
class StepHorizontalItem extends StatelessWidget {
  final String statusName;
  final StepStatus status;
  const StepHorizontalItem({
    Key? key,
    required this.statusName,
    this.status = StepStatus.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return <Widget>[
          // 指示标
          <Widget>[
            // 横线 - 灰色打底
            Container(
              color: AppColors.surfaceVariant.withOpacity(0.5),
              height: 3,
            ),
            // 横线
            if (status == StepStatus.success)
              Container(
                color: AppColors.button,
                height: 3,
              ),
            if (status == StepStatus.running)
              Container(
                color: AppColors.button,
                height: 3,
                width: constraints.minWidth / 2,
              ).alignLeft(),
            // 圆点
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: status == StepStatus.none
                    ? AppColors.surfaceVariant.withOpacity(0.5)
                    : AppColors.button,
                borderRadius: const BorderRadius.all(
                  Radius.circular(7 / 2),
                ),
              ),
            ),
          ]
              .toStack(
                alignment: Alignment.center,
              )
              .paddingBottom(AppSpace.iconTextSmail),

          // 文字
          TextWidget.body3(
            statusName,
          ),
        ].toColumn();
      },
    ).expanded();
  }
}

/// 纵向状态
class StepVerticalItem extends StatelessWidget {
  final String statusName;
  final String? statusDes;
  final String? statusDateTime;
  final StepStatus status;

  const StepVerticalItem({
    Key? key,
    required this.statusName,
    this.statusDes,
    this.statusDateTime,
    this.status = StepStatus.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return <Widget>[
          // 日期
          TextWidget.body1(statusDateTime ?? "-"),

          // 指示标
          <Widget>[
            // 打底灰色
            Container(
              width: 3,
              height: constraints.minHeight,
              color: AppColors.surfaceVariant.withOpacity(0.5),
            ),
            // 横线
            if (status == StepStatus.success)
              Container(
                width: 3,
                height: constraints.minHeight,
                color: AppColors.button,
              ),
            if (status == StepStatus.running)
              Container(
                width: 3,
                height: constraints.minHeight / 2,
                color: AppColors.button,
              ).positioned(top: constraints.minHeight / 2),
            // 圆点
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: status == StepStatus.none
                    ? AppColors.surfaceVariant.withOpacity(0.5)
                    : AppColors.button,
                borderRadius: const BorderRadius.all(
                  Radius.circular(7 / 2),
                ),
              ),
            ),
          ]
              .toStack(
                alignment: Alignment.center,
              )
              .width(30),

          // 说明
          <Widget>[
            TextWidget.title3(statusName),
            TextWidget.body2(
              statusDes ?? "-",
              softWrap: true,
              maxLines: 3,
            ),
          ]
              .toColumn(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .expanded(),
        ].toRow();
      },
    ).constrained(
      minHeight: 70,
    );
  }
}
