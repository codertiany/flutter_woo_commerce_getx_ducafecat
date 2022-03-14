import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/models/index.dart';
import 'package:get/get.dart';

class WidgetsController extends GetxController {
  TextEditingController unameController =
      TextEditingController(text: "hans001");

  TextEditingController pwdController = TextEditingController(text: "123456");
  GlobalKey formKey = GlobalKey<FormState>();

  // size list
  List<KeyValueModel<String>> sizes = [
    KeyValueModel<String>(key: "s", value: "S"),
    KeyValueModel<String>(key: "m", value: "M"),
    KeyValueModel<String>(key: "l", value: "L"),
    KeyValueModel<String>(key: "2x", value: "2X"),
    KeyValueModel<String>(key: "3x", value: "3X"),
    KeyValueModel<String>(key: "4x", value: "4X"),
  ];
  List<String> sizeValues = ["s", "l"];

  // check box
  bool checkVal = true;
  WidgetsController();

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  @override
  void dispose() {
    super.dispose();
    unameController.dispose();
    pwdController.dispose();
  }

  void onCheckBox(bool val) {
    checkVal = val;
    update(["widgets"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void onSizeCange(List<String> values) {
    sizeValues = values;
    update(["widgets"]);
  }

  void onTap() {}

  _initData() {
    update(["widgets"]);
  }
}
