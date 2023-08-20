import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/widget/form_makanan.dart';
import 'package:flutter_application_pesan_makanan/model/all_create.dart';

class ScInputMenu extends StatefulWidget {
  const ScInputMenu({super.key});

  @override
  State<ScInputMenu> createState() => _ScInputMenuState();
}

class _ScInputMenuState extends State<ScInputMenu> {
  AllCreate ac = AllCreate();
  final controllerGambar = TextEditingController();
  final controllerName = TextEditingController();
  final controllerHarga = TextEditingController();
  final controllerDesk = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Makanan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FormMakanan(title: 'Gambar:', controller: controllerGambar),
            FormMakanan(title: 'Nama', controller: controllerName),
            FormMakanan(title: 'Harga', controller: controllerHarga),
            FormMakanan(title: 'Deskripsi', controller: controllerDesk),
            IconButton(
                onPressed: () {
                  final gambar = controllerGambar.text;
                  final nama = controllerName.text;
                  final harga = int.parse(controllerHarga.text);
                  final deskripsi = controllerDesk.text;

                  ac.createMakanan(
                    gambar: gambar,
                    nama: nama,
                    harga: harga,
                    deskripsi: deskripsi,
                    jmlpesan: 0,
                    pembayaran: '',
                    total: 0,
                  );
                },
                icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
