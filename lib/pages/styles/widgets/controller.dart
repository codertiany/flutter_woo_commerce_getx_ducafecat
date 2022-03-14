import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/models/index.dart';
import 'package:get/get.dart';

class WidgetsController extends GetxController {
  WidgetsController();

  TextEditingController unameController =
      TextEditingController(text: "hans001");
  TextEditingController pwdController = TextEditingController(text: "123456");
  GlobalKey formKey = GlobalKey<FormState>();

  List<KeyValueModel<String>> sizes = [
    KeyValueModel<String>(key: "s", value: "S"),
    KeyValueModel<String>(key: "m", value: "M"),
    KeyValueModel<String>(key: "l", value: "L"),
    KeyValueModel<String>(key: "2x", value: "XX"),
    KeyValueModel<String>(key: "3x", value: "XXX"),
    KeyValueModel<String>(key: "4x", value: "XXXX"),
  ];

  // check box
  bool checkVal = true;
  void onCheckBox(bool val) {
    checkVal = val;
    update(["widgets"]);
  }

  _initData() {
    update(["widgets"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

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
}
