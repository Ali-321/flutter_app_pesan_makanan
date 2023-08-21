import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/provider/all_data.dart';
import 'package:provider/provider.dart';

class Tombol extends StatefulWidget {
  String idMakanan;

  int index;
  Tombol({
    Key? key,
    required this.idMakanan,
    required this.index,
  }) : super(key: key);

  @override
  State<Tombol> createState() => _TombolState();
}

class _TombolState extends State<Tombol> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Provider.of<AllData>(context, listen: false)
                      .decrementPesanan(widget.idMakanan, widget.index);
                },
                child: const Icon(Icons.remove)),
            Container(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Consumer<AllData>(builder: (context, value, child) {
                return Text(
                    '${value.makananList.elementAt(widget.index).jmlPesan}');
              }),
            ),
            TextButton(
                onPressed: () {
                  Provider.of<AllData>(context, listen: false)
                      .incrementPesanan(widget.idMakanan);
                },
                child: const Icon(Icons.add)),
            Container(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Consumer<AllData>(builder: (context, value, child) {
                return Text(
                    '${value.makananList.elementAt(widget.index).total}');
              }),
            ),
          ],
        ),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}
