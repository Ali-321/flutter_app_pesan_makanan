import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_pesan_makanan/model/makanan.dart';

class Menu {
  Future createMakanan({
    required String gambar,
    required String nama,
    required int harga,
    required String deskripsi,
  }) async {
    final docMenu = FirebaseFirestore.instance.collection('menu').doc();
    final makanan = Makanan(
      id: docMenu.id,
      gambar: gambar,
      nama: nama,
      harga: harga,
      deskripsi: deskripsi,
    );

    final json = makanan.toJson();
    await docMenu.set(json);
  }

  Stream<List<Makanan>> readMenu() =>
      FirebaseFirestore.instance.collection('menu').snapshots().map((event) =>
          event.docs.map((e) => Makanan.fromJson(e.data())).toList());
}
