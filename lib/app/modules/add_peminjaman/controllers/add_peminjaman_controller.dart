
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/provider/storage_provider.dart';

class AddPeminjamanController extends GetxController {
  //TODO: Implement AddPeminjamanController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController user_idController = TextEditingController();
  final TextEditingController book_idController = TextEditingController();
  final TextEditingController tanggal_pinjamController = TextEditingController();
  final TextEditingController tanggal_kembaliController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
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
  addpinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //nge close keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: {
              'tanggal_pinjam': tanggal_pinjamController.text.toString(),
              'tanggal_kembali': tanggal_kembaliController.text.toString(),
              'user_id': int.parse(StorageProvider.read(StorageKey.iduser)),
              'book_id': int.parse(Get.parameters['id'].toString())
            });
        if (response.statusCode == 201) {
          Get.back();
        } else {
          Get.snackbar('Sorry', 'Login Gagal', backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar('Sorry', '${e.response?.data['message']}',
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar('Sorry', e.message ?? '', backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}
