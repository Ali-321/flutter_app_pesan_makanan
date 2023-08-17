import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/komponen/FormMakan.dart';
import 'package:flutter_application_pesan_makanan/model/menu.dart';

class ScInputMenu extends StatefulWidget {
  const ScInputMenu({super.key});

  @override
  State<ScInputMenu> createState() => _ScInputMenuState();
}

class _ScInputMenuState extends State<ScInputMenu> {
  Menu menu = Menu();
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
            FormMakan(title: 'Gambar:', controller: controllerGambar),
            FormMakan(title: 'Nama', controller: controllerName),
            FormMakan(title: 'Harga', controller: controllerHarga),
            FormMakan(title: 'Deskripsi', controller: controllerDesk),
            IconButton(
                onPressed: () {
                  final gambar = controllerGambar.text;
                  final nama = controllerName.text;
                  final harga = int.parse(controllerHarga.text);
                  final deskripsi = controllerDesk.text;

                  menu.createMakanan(
                    gambar: gambar,
                    nama: nama,
                    harga: harga,
                    deskripsi: deskripsi,
                  );
                },
                icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
