import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_pesan_makanan/model/makanan.dart';
import 'package:flutter_application_pesan_makanan/model/pesan.dart';

class AllCreate {
  Future createMakanan({
    required String gambar,
    required String nama,
    required int harga,
    required String deskripsi,
    required int jmlpesan,
    required int total,
    required String pembayaran,
  }) async {
    final docMenu = FirebaseFirestore.instance.collection('menu').doc();
    final makanan = Makanan(
      id: docMenu.id,
      gambar: gambar,
      nama: nama,
      harga: harga,
      deskripsi: deskripsi,
      jmlPesan: jmlpesan,
      total: total,
      pembayaran: pembayaran,
      waktu: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );
    final json = makanan.toJson();
    await docMenu.set(json);
  }

  Future createPesanan(
      {required int jmlpesan,
      required int total,
      required String pembayaran,
      required String idMakanan}) async {
    final docPesan = FirebaseFirestore.instance.collection('pesan').doc();
    final pesan = Pesan(
      idPesan: docPesan.id,
      idMakanan: idMakanan,
      jmlPesan: jmlpesan,
      total: total,
      pembayaran: pembayaran,
      waktu: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );

    final json = pesan.toJson();
    await docPesan.set(json);
  }
}
