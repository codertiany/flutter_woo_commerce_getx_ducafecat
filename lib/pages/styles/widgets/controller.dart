import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';

class WidgetsController extends GetxController {
  WidgetsController();

  // 样式
  onThemeSelected() async {
    await ConfigService.to.switchThemeModel();
    update(["widgets"]);
  }

  // 多语言
  List<KeyValueModel> languages = [];
  KeyValueModel? language;
  void onShowLanguagesBottomSheet() {
    ActionBottomSheet.showMaterialModal(
      context: Get.context,
      child: PickerSingleWidget(
        title: "Language",
        value: language,
        items: languages,
        onSelected: onLanguageSelected,
      ),
    );
  }

  onLanguageSelected(KeyValueModel item) {
    language = item;
    ConfigService.to.onLocaleUpdate(item.value);
    Loading.success();
    update(["widgets"]);
  }

  // 对话框
  void onDialog() {
    ActionDialog.normal(
      context: Get.context!,
      strTitle: "对话框标题",
      strContent: "对话框内容说明",
      strConfirm: "设置",
      strCancel: "取消",
      onConfirm: () => Loading.success(),
      // confirm: TextWidget.body1(
      //   "设置",
      //   color: AppColors.onSecondaryContainer,
      // ).paddingAll(AppSpace.button).decorated(
      //       color: AppColors.secondaryContainer,
      //       borderRadius: BorderRadius.circular(AppRadius.button),
      //     ),
      // cancel: const TextWidget.body1(
      //   "取消",
      // ),
    );
  }

  _initData() {
    for (var i = 0; i < Translation.supportedLocales.length; i++) {
      var lang = Translation.supportedLocales[i];
      languages.add(KeyValueModel(key: lang.toLanguageTag(), value: lang));
    }
    language = KeyValueModel(
        key: ConfigService.to.locale.toLanguageTag(),
        value: ConfigService.to.locale);

    update(["widgets"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

}
