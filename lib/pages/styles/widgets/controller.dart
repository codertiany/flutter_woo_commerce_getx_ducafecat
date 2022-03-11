import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsController extends GetxController {
  WidgetsController();

  TextEditingController unameController =
      TextEditingController(text: "hans001");
  TextEditingController pwdController = TextEditingController(text: "123456");
  GlobalKey formKey = GlobalKey<FormState>();

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
