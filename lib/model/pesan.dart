import 'package:flutter/cupertino.dart';

class Pesan extends ChangeNotifier {
  Pesan(
      {required this.idMakanan,
      required this.jmlPesan,
      required this.total,
      required this.pembayaran,
      required this.waktu,
      required this.idPesan});

  String idPesan;
  String idMakanan;
  int jmlPesan;
  int total;
  String pembayaran;
  final waktu;

  Map<String, dynamic> toJson() => {
        'idPesan': idPesan,
        'idMakanan': idMakanan,
        'jmlPesan': jmlPesan,
        'total': total,
        'pembayaran': pembayaran,
        'waktu': waktu,
      };
}
