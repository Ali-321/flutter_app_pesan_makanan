import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/model/makanan.dart';
import 'package:flutter_application_pesan_makanan/model/riwayat_pesanan.dart';

class AllData extends ChangeNotifier {
  // int _tempJml = 0;
  final List<int> _indexPesan = [];
  List<Makanan> _makananList = [];
  List<RiwayatPesanan> _riwayatPesanan = [];
  String? _selectedPembayaran;
  int _items = 0;
  int _totalPesanan = 0;
  //List<Pesan> _pesanList = [];

  List<Makanan> get makananList => _makananList;
  List<RiwayatPesanan> get riwayatPesanan => _riwayatPesanan;
  int get items => _items;
  int get totalPesanan => _totalPesanan;
  String? get selectedPembayaran => _selectedPembayaran;
  List<int> get indexPesan => _indexPesan;

  //List<Pesan> get pesanList => _pesanList;
  //int get tempJml => _tempJml;

  /* void increment(int index, String idMakanan) {
    _pesanList.elementAt(index).jmlPesan++;
    for (var element in pesanList) {
      if (idMakanan == element.idMakanan) {
        _tempJml = element.jmlPesan;
      }
      notifyListeners();
    }
  }
*/

  void pilihPembayaran(String? sPembayaran) {
    _selectedPembayaran = sPembayaran;
    notifyListeners();
  }

/*
  void decrement(int index) {
    _pesanList.elementAt(index).jmlPesan--;
    notifyListeners();
  }
*/
  Future<void> fetchAllData() async {
    final snapshot = await FirebaseFirestore.instance.collection('menu').get();
    final snapshot2 =
        await FirebaseFirestore.instance.collection('riwayatPesanan').get();

    final makananList =
        snapshot.docs.map((e) => Makanan.fromJson(e.data())).toList();
    _makananList = makananList;

    final riwayatPesanan =
        snapshot2.docs.map((e) => RiwayatPesanan.fromJson(e.data())).toList();
    _riwayatPesanan = riwayatPesanan;

    notifyListeners();
  }

  Stream<List<RiwayatPesanan>> readRiwayatPesan() => FirebaseFirestore.instance
      .collection('riwayatPesanan').orderBy('waktu', descending: true)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => RiwayatPesanan.fromJson(e.data())).toList());

  void incrementPesanan(String idMakanan) {
    int i = 0;

    for (var element in _makananList) {
      if (idMakanan == element.id) {
        _makananList.elementAt(i).jmlPesan++;
        _makananList.elementAt(i).jmlPesan * _makananList.elementAt(i).harga;
        _makananList.elementAt(i).total = _makananList.elementAt(i).jmlPesan *
            _makananList.elementAt(i).harga;
        if (0 < element.jmlPesan && element.jmlPesan == 1) {
          _indexPesan.add(i);
          _items++;
        }

        _totalPesanan += _makananList.elementAt(i).harga;
      }
      i++;
    }
    notifyListeners();
  }

  void decrementPesanan(String idMakanan, int index) {
    if (0 < _makananList.elementAt(index).jmlPesan) {
      int i = 0;
      for (var element in _makananList) {
        if (idMakanan == element.id) {
          _makananList.elementAt(i).jmlPesan--;
          _makananList.elementAt(i).total = _makananList.elementAt(i).jmlPesan *
              _makananList.elementAt(i).harga;

          _totalPesanan -= _makananList.elementAt(i).harga;
        }
        i++;
      }
      if (0 == _makananList.elementAt(index).jmlPesan) {
        _indexPesan.remove(index);
        _items--;
      }
    }
    notifyListeners();
  }

/*
  void addPesan(Pesan pesan) {
    _pesanList.add(pesan);
    notifyListeners();
  }
*/
/*
  void removePesan(Pesan pesan) {
    _pesanList.remove(pesan);
    notifyListeners();
  }

*/
}
 /* Stream<List<Makanan>> readMenu() =>
      FirebaseFirestore.instance.collection('menu').snapshots().map((event) =>
          event.docs.map((e) => Makanan.fromJson(e.data())).toList());
        */

