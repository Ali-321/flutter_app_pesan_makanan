import 'package:cloud_firestore/cloud_firestore.dart';

class RiwayatPesanan {
  RiwayatPesanan(
      {required this.items,
      required this.total,
      required this.pembayaran,
      required this.waktu,
      required this.id});
  String id;
  int items;
  int total;
  String? pembayaran;
  final waktu;

  Map<String, dynamic> toJson() => {
        'id': id,
        'items': items,
        'total': total,
        'pembayaran': pembayaran,
        'waktu': waktu,
      };

  static RiwayatPesanan fromJson(Map<String, dynamic> json) => RiwayatPesanan(
      id: json['id'] as String ,
      items: json['items']as int,
      total: json['total']as int,
      pembayaran: json['pembayaran'] as String,
      waktu: (json['waktu'] as Timestamp).toDate());
}
