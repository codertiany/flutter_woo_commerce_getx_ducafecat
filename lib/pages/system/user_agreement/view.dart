import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class UserAgreementPage extends GetView<UserAgreementController> {
  const UserAgreementPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAgreementController>(
      init: UserAgreementController(),
      id: "user_agreement",
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
