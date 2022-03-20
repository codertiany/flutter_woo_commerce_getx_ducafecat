import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../index.dart';

/// 选取图片 view
class PickerImageWidget extends StatelessWidget {
  final Function(AssetEntity? result)? onTapTake;
  final Function(List<AssetEntity>? result)? onTapAlbum;

  const PickerImageWidget({
    Key? key,
    this.onTapTake,
    this.onTapAlbum,
  }) : super(key: key);

  _buildView() {
    return <Widget>[
      // 拍照
      ButtonWidget.iconText(
        IconWidget.icon(
          CupertinoIcons.camera_fill,
          size: 16,
          color: AppColors.onPrimary,
        ),
        LocaleKeys.pickerTakeCamera.tr,
        bgColor: AppColors.primary,
        textColor: AppColors.onPrimary,
        onTap: onTapTake == null
            ? null
            : () async {
                var result = await ActionPicker.camera(
                  context: Get.context!,
                  enableRecording: false,
                );
                onTapTake!(result);
                Get.back();
              },
      ).height(35).paddingBottom(AppSpace.listRow),

      // 相册
      ButtonWidget.iconText(
        IconWidget.icon(
          CupertinoIcons.music_albums_fill,
          size: 16,
        ),
        LocaleKeys.pickerSelectAlbum.tr,
        onTap: onTapAlbum == null
            ? null
            : () async {
                var result = await ActionPicker.assets(
                  context: Get.context!,
                  type: RequestType.image,
                );
                onTapAlbum!(result);
                Get.back();
              },
      ).height(35).paddingBottom(AppSpace.listRow),

      // 取消
      ButtonWidget.text(LocaleKeys.commonBottomCancel.tr).height(35),

      // end
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
        )
        .padding(all: AppSpace.card)
        .decorated(
          color: AppColors.background,
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.card),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
