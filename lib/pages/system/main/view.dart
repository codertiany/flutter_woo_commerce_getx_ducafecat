import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
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
