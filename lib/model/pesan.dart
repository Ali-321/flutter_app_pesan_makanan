import 'package:flutter_application_pesan_makanan/model/makanan.dart';

class Pesan {
  Pesan({required this.pesan, required jmlPesan});
  List<Makanan> pesan;
  final waktu =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
}
