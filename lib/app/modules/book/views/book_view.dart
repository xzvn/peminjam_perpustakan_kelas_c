import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/MODEL/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_BOOK),
          child: Icon(Icons.add),
        ),
        body: controller.obx((state) =>
            ListView.separated(
              itemCount: state!.length,
              itemBuilder: (context, index) {
                DataBook dataBook = state [index];
                return ListTile(
                    title: Text("${dataBook.judul}"),
                    subtitle: Text("penulis ${dataBook.penulis}\n${dataBook
                        .penerbit} = ${dataBook.tahunTerbit}"),
                    trailing: ElevatedButton(onPressed: ()
                =>
                    Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                      'id': (dataBook.id ?? 0).toString(),
                      'judul': dataBook.judul ?? '-'
                    })
                ,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // Set the button background color
                        onPrimary: Colors.white, // Set the button text color
                      ),
                      child: Text("Pinjam"),),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ), onLoading: Center(child: CupertinoActivityIndicator(),))
    );
  }
}
