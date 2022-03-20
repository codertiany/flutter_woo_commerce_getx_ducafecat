import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 对话框
class ActionDialog {
  static Future normal({
    required BuildContext context,
    Widget? title,
    Widget? content,
    Widget? confirm,
    Widget? cancel,
    Color? confirmBackgroundColor,
    Function()? onConfirm,
    Function()? onCancel,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: <Widget>[
            // 标题
            if (title != null) title.paddingBottom(AppSpace.listRow),

            // 内容
            if (content != null) content.paddingBottom(AppSpace.listRow),

            // cancel confirm
            <Widget>[
              // cancel
              (cancel ??
                      ButtonWidget.text(
                        LocaleKeys.commonBottomCancel.tr,
                        bgColor: AppColors.secondaryContainer,
                        textColor: AppColors.onSecondaryContainer,
                      ))
                  .onTap(() {
                Get.back(closeOverlays: true);
                if (onCancel != null) onCancel();
              }),

              // confirm
              (confirm ??
                      ButtonWidget.text(
                        LocaleKeys.commonBottomConfirm.tr,
                        bgColor: AppColors.secondaryContainer,
                        textColor: AppColors.onSecondaryContainer,
                      ))
                  .onTap(() {
                Get.back(closeOverlays: true);
                if (onConfirm != null) onConfirm();
              }),
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),

            // end
          ]
              .toColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
              )
              .paddingAll(AppSpace.card)
              .decorated(
                color: confirmBackgroundColor ?? AppColors.background,
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
        );
      },
    );
  }
}
