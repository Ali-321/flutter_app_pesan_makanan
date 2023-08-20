import 'package:cloud_firestore/cloud_firestore.dart';

class Makanan {
  String id;
  final String gambar;
  final String nama;
  final int harga;
  final String deskripsi;
  int jmlPesan;
  int total;
  String pembayaran;
  final waktu;

  Makanan({
    required this.jmlPesan,
    required this.total,
    required this.pembayaran,
    required this.waktu,
    this.id = '',
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.deskripsi,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'gambar': gambar,
        'harga': harga,
        'deskripsi': deskripsi
      };

  static Makanan fromJson(Map<String, dynamic> json) => Makanan(
      id: json['id'],
      gambar: json['gambar'],
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      jmlPesan: json['jmlPesan'],
      total: json['total'],
      pembayaran: json['pembayaran'],
      waktu: json['waktu'] as Timestamp);
}
