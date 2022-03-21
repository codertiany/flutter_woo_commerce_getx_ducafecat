import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class TextFormPage extends GetView<TextFormController> {
  const TextFormPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildTextForm().padding(all: AppSpace.page),
    );
  }

  Widget _buildTextForm() {
    return Form(
        key: controller.formKey, //设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: <Widget>[
          TextFormWidget(
            // autofocus: true,
            keyboardType: TextInputType.emailAddress,
            controller: controller.unameController,
            labelText: "email",
            validator: Validatorless.multiple([
              Validatorless.required("The field is obligatory"),
              Validatorless.min(6,
                  "Length cannot be less than @size".trParams({"size": "6"})),
              Validatorless.max(
                  18,
                  "Length cannot be greater than @size"
                      .trParams({"size": "18"})),
              Validatorless.email("The field must be an email"),
            ]),
          ),
          TextFormWidget(
            controller: controller.pwdController,
            labelText: "password",
            isObscure: true,
            validator: Validatorless.multiple([
              Validatorless.required("The field is obligatory"),
              Validatorless.min(6,
                  "Length cannot be less than @size".trParams({"size": "6"})),
              Validatorless.max(
                  18,
                  "Length cannot be greater than @size"
                      .trParams({"size": "18"})),
            ]),
          ),
          ButtonWidget.primary(
            "submit",
            onTap: () {
              if ((controller.formKey.currentState as FormState).validate()) {
                try {} finally {}
              }
            },
          ).tight(width: 100, height: 50),
        ].toColumn());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFormController>(
      init: TextFormController(),
      id: "text_form",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("表单输入框")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
