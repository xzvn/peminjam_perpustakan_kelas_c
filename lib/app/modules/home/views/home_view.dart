import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Set the app bar background color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.BOOK),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Set the button background color
                onPrimary: Colors.white, // Set the button text color
              ),
              child: Text("List Buku"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Set the button background color
                onPrimary: Colors.white, // Set the button text color
              ),
              child: Text("Pinjam"),
            ),
          ],
        ),
      ),
    );
  }
}
