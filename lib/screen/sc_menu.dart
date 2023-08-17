import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/komponen/tombol.dart';
import 'package:flutter_application_pesan_makanan/model/makanan.dart';
import 'package:flutter_application_pesan_makanan/model/menu.dart';

class ScMenu extends StatefulWidget {
  const ScMenu({super.key});

  @override
  State<ScMenu> createState() => _ScMenuState();
}

class _ScMenuState extends State<ScMenu> {
  Menu menu = Menu();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Makanan>>(
          stream: menu.readMenu(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Somthing wrong ! $snapshot");
            } else if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView(
                children: items.map(buildItems).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget buildItems(Makanan makanan) => Column(
      children: [
        ListTile(
          leading: Container(
              height: 250,
              width: 100,
              child: Image(
                image: NetworkImage(makanan.gambar),
                fit: BoxFit.fill,
              )),
          title: Text(makanan.nama),
          subtitle:
              Text('${makanan.deskripsi} \n RP ${makanan.harga.toString()}'),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
              const Text(''),
              ElevatedButton(
                  onPressed: () {}, child: const Icon(Icons.minimize)),
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
