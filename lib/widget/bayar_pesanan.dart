import 'package:flutter/material.dart';

import 'package:flutter_application_pesan_makanan/screen/sc_daftar_pesanan.dart';
import 'package:provider/provider.dart';

import '../provider/all_data.dart';

class BayarPesanan extends StatefulWidget {
  BayarPesanan({
    Key? key,
  }) : super(key: key);

  @override
  State<BayarPesanan> createState() => _BayarPesananState();
}

class _BayarPesananState extends State<BayarPesanan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 530,
      ),
      decoration: BoxDecoration(border: Border.all(width: 0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<AllData>(
                builder: (context, value, child) {
                  return Text(' ${value.items} items');
                },
              ),
              Consumer<AllData>(
                builder: (context, value, child) {
                  return Text('Rp.${value.totalPesanan}');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScDaftarPesanan()));
              },
              child: const Text('Bayar Pesanan')),
        ],
      ),
    );
  }
}
