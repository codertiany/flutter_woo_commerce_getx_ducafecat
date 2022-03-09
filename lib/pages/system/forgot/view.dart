import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ForgotPage extends GetView<ForgotController> {
  const ForgotPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      init: ForgotController(),
      id: "forgot",
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
