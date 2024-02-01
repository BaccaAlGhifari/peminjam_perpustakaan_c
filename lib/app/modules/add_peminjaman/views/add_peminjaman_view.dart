import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller:  controller.tanggalpinjamController,
                  decoration: InputDecoration(hintText: "Tanggal Pinjam"),
                ),
                TextFormField(
                  controller:  controller.tanggalkembaliController,
                  decoration: InputDecoration(hintText: "Tanggal Kembali"),
                ),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                    onPressed: () {
                      controller.Pinjam();
                    },
                    child: Text("PINJAM")))
              ],
            ),
          )
      ),
    );
  }
}
