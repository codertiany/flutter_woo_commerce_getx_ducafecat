import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

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
          child: Container(
            padding: EdgeInsets.all(AppSpace.card),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.surfaceVariant,
                  ),
                  child: title != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: title,
                        )
                      : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.surfaceVariant,
                    ),
                    child: content ?? Text(LocaleKeys.dialogRemove.tr),
                  ),
                ),
                SizedBox(height: AppSpace.card),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        textWidget:
                            cancel ?? Text(LocaleKeys.commonBottomCancel.tr),
                        onTap: () {
                          Get.back(closeOverlays: true);
                          if (onCancel != null) onCancel();
                        },
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        bgColor:
                            confirmBackgroundColor ?? AppColors.surfaceVariant,
                        textWidget:
                            confirm ?? Text(LocaleKeys.commonBottomConfirm.tr),
                        onTap: () {
                          Get.back(closeOverlays: true);
                          if (onConfirm != null) onConfirm();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
