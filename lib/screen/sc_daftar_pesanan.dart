import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/widget/pembayaran.dart';

import 'package:provider/provider.dart';

import '../provider/all_data.dart';

class ScDaftarPesanan extends StatefulWidget {
  const ScDaftarPesanan({super.key});

  @override
  State<ScDaftarPesanan> createState() => _ScDaftarPesananState();
}

class _ScDaftarPesananState extends State<ScDaftarPesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pesanan'),
        backgroundColor: const Color.fromARGB(255, 15, 126, 119),
      ),
      body: Consumer<AllData>(
        builder: (context, allData, child) => Stack(children: [
          ListView.builder(
            itemCount: allData.indexPesan.length,
            itemBuilder: (context, index) => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: SizedBox(
                    width: 250,
                    child: Text(
                        allData.makananList[allData.indexPesan[index]].nama),
                  ),
                  title: Text(
                      '${allData.makananList[allData.indexPesan[index]].jmlPesan} X ${allData.makananList[allData.indexPesan[index]].harga}'),
                  subtitle: Text(allData
                      .makananList[allData.indexPesan[index]].total
                      .toString()),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 300,
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const SizedBox(
                    width: 150,
                    child: Text('Total', textAlign: TextAlign.end),
                  ),
                  title: Text(
                    allData.totalPesanan.toString(),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Pembayaran(),
            ],
          )
        ]),
      ),
    );
  }
}
