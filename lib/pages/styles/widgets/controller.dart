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

  // color list
  List<KeyValueModel<String>> colors = [
    KeyValueModel<String>(key: "ffb5b5"),
    KeyValueModel<String>(key: "edb5ff"),
    KeyValueModel<String>(key: "c8b5ff"),
    KeyValueModel<String>(key: "b5ddff"),
    KeyValueModel<String>(key: "ffdb92"),
  ];
  List<String> colorValues = ["ffb5b5"];

  // color list
  List<KeyValueModel<String>> tags = [
    KeyValueModel<String>(key: "adidas", value: "Adidas"),
    KeyValueModel<String>(key: "lotto", value: "Lotto"),
    KeyValueModel<String>(key: "nike", value: "Nike"),
    KeyValueModel<String>(key: "apex", value: "Apex"),
    KeyValueModel<String>(key: "reebok", value: "Reebok"),
    KeyValueModel<String>(key: "puma", value: "Puma"),
  ];
  List<String> tagValues = ["nike"];

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

  void onColorCange(List<String> values) {
    colorValues = values;
    update(["widgets"]);
  }

  void onTagCange(List<String> values) {
    tagValues = values;
    update(["widgets"]);
  }

  void onTap() {}

  _initData() {
    update(["widgets"]);
  }
}
