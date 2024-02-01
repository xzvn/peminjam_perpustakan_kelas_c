import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Set the app bar background color
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  hintText: "Masukan Username",
                  fillColor: Colors.white, // Set the text field background color
                  filled: true,
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Username Tidak Boleh Kosong ";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: "Masukan Password",
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Password Tidak Boleh Kosong ";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, // Set the button background color
                ),
                child: Text("Login"),
              )),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Set the button background color
                ),
                child: Text("Open To Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
