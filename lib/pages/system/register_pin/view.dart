import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterPinPage extends GetView<RegisterPinController> {
  const RegisterPinPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPinController>(
      init: RegisterPinController(),
      id: "register_pin",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
