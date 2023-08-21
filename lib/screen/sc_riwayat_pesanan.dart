import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/model/riwayat_pesanan.dart';
import 'package:flutter_application_pesan_makanan/screen/sc_menu.dart';

import 'package:provider/provider.dart';

import '../provider/all_data.dart';
import 'package:intl/intl.dart';

class ScRiwayatPembayaran extends StatefulWidget {
  const ScRiwayatPembayaran({super.key});

  @override
  State<ScRiwayatPembayaran> createState() => _ScRiwayatPembayaranState();
}

class _ScRiwayatPembayaranState extends State<ScRiwayatPembayaran> {
  final formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        backgroundColor: const Color.fromARGB(255, 15, 126, 119),
      ),
      body: Consumer<AllData>(
        builder: (context, allData, child) => Stack(
          children: [
            StreamBuilder<List<RiwayatPesanan>>(
                stream: allData.readRiwayatPesan(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Somthing went wrong ! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final rp = snapshot.data!;
                    return ListView(
                      children: rp.map((buildRiwayatPesan)).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const ScMenu()),
                            (Route<dynamic> route) => false);
                      },
                      child: const Text('Kembali Ke Menu')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildRiwayatPesan(RiwayatPesanan rp) => Column(
        children: [
          const SizedBox(
            width: 250,
          ),
          ListTile(
            leading: SizedBox(
                width: 150,
                child: Text('${rp.items} item\n${formatter.format(rp.waktu)}')),
            title: Text('${rp.total}\n${rp.pembayaran}'),
          ),
        ],
      );
}
