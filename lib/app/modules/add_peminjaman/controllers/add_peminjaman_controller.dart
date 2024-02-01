import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peminjam_perpustakaan_c/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalpinjamController = TextEditingController();
  final TextEditingController  tanggalkembaliController = TextEditingController();
  final count = 0.obs;
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Pinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.pinjam,
          data: dio.FormData.fromMap({
            "tanggal_pinjam": tanggalpinjamController.text.toString(),
            "tanggal_kembali": tanggalkembaliController.text.toString(),
            "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
            "book_id": int.parse(Get.parameters['id'].toString()),

          }),
        );
        if (response.statusCode == 201) {
          Get.back();
        } else {
          Get.snackbar("Sorry", "Gagal menambahkan buku", backgroundColor: Colors.orange);
        }
      }
    } catch (e) {
      loading(false);
      if (e is dio.DioException) {
        loading(false);
        if (e.response != null) {
          if (e.response?.data != null) {
            Get.snackbar(
              "Sorry",
              "${e.response?.data['message']}",
              backgroundColor: Colors.orange,
            );
          }
        } else {
          Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
        }
      } else {
        loading(false);
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    } finally {
      loading(false);
    }
  }
}
