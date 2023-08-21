import 'package:flutter/material.dart';

import 'package:flutter_application_pesan_makanan/provider/all_data.dart';
import 'package:flutter_application_pesan_makanan/screen/sc_riwayat_pesanan.dart';
import 'package:flutter_application_pesan_makanan/widget/bayar_pesanan.dart';
import 'package:provider/provider.dart';

import '../widget/tombol.dart';

class ScMenu extends StatefulWidget {
  const ScMenu({super.key});

  @override
  State<ScMenu> createState() => _ScMenuState();
}

class _ScMenuState extends State<ScMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 126, 119),
        title: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScRiwayatPembayaran()));
              },
              child: const Text('Riwayat Pesanan')),
        ),
      ),
      body: Consumer<AllData>(
        builder: (context, allData, child) => Stack(children: [
          ListView.builder(
            itemCount: allData.makananList.length,
            itemBuilder: (context, index) => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: SizedBox(
                      height: 350,
                      width: 100,
                      child: Image(
                        image: NetworkImage(allData.makananList[index].gambar),
                        fit: BoxFit.fill,
                      )),
                  title: Text(allData.makananList[index].nama),
                  subtitle: Text(
                      '${allData.makananList[index].deskripsi} \n RP ${allData.makananList[index].harga.toString()}'),
                ),
                Tombol(
                  idMakanan: allData.makananList[index].id.toString(),
                  index: index,
                ),
              ],
            ),
          ),
          BayarPesanan(),
        ]),
      ),
    );
  }
}
