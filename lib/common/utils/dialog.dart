import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 对话框
class ActionDialog {
  static Future normal({
    required BuildContext context,
    String? strConfirm,
    String? strCancel,
    String? strTitle,
    String? strContent,
    Widget? title,
    Widget? content,
    Widget? confirm,
    Widget? cancel,
    Color? confirmBackgroundColor,
    Function()? onConfirm,
    Function()? onCancel,
  }) async {
    if (strTitle != null) {
      title = TextWidget.title3(strTitle);
    }
    if (strContent != null) {
      content = TextWidget.body2(strContent);
    }
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
                      TextWidget.body1(
                        strCancel ?? LocaleKeys.commonBottomCancel.tr,
                      ))
                  .onTap(() {
                Get.back(closeOverlays: true);
                if (onCancel != null) onCancel();
              }),

              // confirm
              (confirm ??
                      TextWidget.body1(
                        strConfirm ?? LocaleKeys.commonBottomConfirm.tr,
                        color: AppColors.onSecondaryContainer,
                      ).paddingAll(AppSpace.button).decorated(
                            color: AppColors.secondaryContainer,
                            borderRadius:
                                BorderRadius.circular(AppRadius.button),
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
