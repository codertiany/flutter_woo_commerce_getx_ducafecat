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
class StepRowItem extends StatelessWidget {
  final String stateName;
  final StepStatus status;
  const StepRowItem({
    Key? key,
    required this.stateName,
    this.status = StepStatus.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return <Widget>[
          // 横线、圆点
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
                // width: 70.w,
              ),
            ),
          ]
              .toStack(
                alignment: Alignment.center,
              )
              .paddingBottom(AppSpace.iconTextSmail),
          // 文字
          TextWidget.body3(
            stateName,
          ),
        ].toColumn();
      },
    ).expanded();
  }
}
