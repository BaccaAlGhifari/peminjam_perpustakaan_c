import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
    child: Form(
    key: controller.formKey,
    child: Column(
    children: [
    TextFormField(
    controller:  controller.namaController,
    decoration: InputDecoration(hintText: "Nama"),
    ),
    TextFormField(
    controller:  controller.usernameController,
    decoration: InputDecoration(hintText: "Username"),
    ),
    TextFormField(
    controller:  controller.telpController,
    decoration: InputDecoration(hintText: "No Telp"),
    ),
    TextFormField(
    controller:  controller.alamatController,
    decoration: InputDecoration(hintText: "Alamat"),
    ), TextFormField(
    controller:  controller.passwordController,
    decoration: InputDecoration(hintText: "Password"),
    ),
    Obx(() => controller.loading.value
    ? CircularProgressIndicator()
        : ElevatedButton(
    onPressed: () {
    controller.add();
    },
    child: Text("Register")))
    ],
    ),
    ))
    );
  }
}
