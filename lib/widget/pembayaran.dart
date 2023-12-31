import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/model/all_create.dart';
import 'package:flutter_application_pesan_makanan/provider/all_data.dart';
import 'package:provider/provider.dart';

import '../screen/sc_riwayat_pesanan.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<AllData>(context, listen: false);
    return Stack(
      children: [
        SizedBox(
          height: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Pilih Pembayaran:',
                    style: TextStyle(fontSize: 16),
                  )),
              ListTile(
                leading: Radio<String>(
                  value: 'Tunai',
                  groupValue: p.selectedPembayaran,
                  onChanged: (value) {
                    p.pilihPembayaran(value);
                  },
                ),
                title: const Text('Tunai'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Debit BCA',
                  groupValue: p.selectedPembayaran,
                  onChanged: (value) {
                    p.pilihPembayaran(value);
                  },
                ),
                title: const Text('Debit BCA'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Ovo',
                  groupValue: p.selectedPembayaran,
                  onChanged: (value) {
                    p.pilihPembayaran(value);
                  },
                ),
                title: const Text('Ovo'),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            right: 30,
            left: 30,
            child: ElevatedButton(
                onPressed: () {
                  final p = Provider.of<AllData>(context, listen: false);
                  AllCreate().createRiwayatPesanan(
                      items: p.items,
                      total: p.totalPesanan,
                      pembayaran: p.selectedPembayaran);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScRiwayatPembayaran()));
                },
                child: const Text('Bayar Sekarang')))
      ],
    );
  }
}
