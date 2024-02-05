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
        backgroundColor: Colors.teal,
      ),
      body: Center(
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.namaController,
                    decoration: InputDecoration(hintText: "Masukan Nama"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Nama Tidak Boleh Kosong ";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukan Username"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Username Tidak Boleh Kosong ";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.telpController,
                    decoration: InputDecoration(hintText: "Masukan Telp"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Telp Tidak Boleh Kosong ";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.alamatController,
                    decoration:
                        InputDecoration(hintText: "Masukan Alamat"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Alamat Terbit Tidak Boleh Kosong ";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration:
                        InputDecoration(hintText: "Masukan  Password"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Password Tidak Boleh Kosong ";
                      }
                      return null;
                    },
                  ),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.Add();
                          },
                          child: Text("REGISTER")))
                ],
              ))),
    );
  }
}
