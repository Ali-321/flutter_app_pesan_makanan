import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pesan_makanan/model/makanan.dart';
import '../model/pesan.dart';

class AllData extends ChangeNotifier {
  // int _tempJml = 0;
  List<Makanan> _makananList = [];
  int _items = 0;
  int _totalPesanan = 0;
  //List<Pesan> _pesanList = [];

  List<Makanan> get makananList => _makananList;
  int get items => _items;
  int get totalPesanan => _totalPesanan;

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

/*
  void decrement(int index) {
    _pesanList.elementAt(index).jmlPesan--;
    notifyListeners();
  }
*/
  Future<void> fetchMakanan() async {
    final snapshot = await FirebaseFirestore.instance.collection('menu').get();
    final makananList =
        snapshot.docs.map((e) => Makanan.fromJson(e.data())).toList();
    _makananList = makananList;
    notifyListeners();
  }

  void incrementPesanan(String idMakanan) {
    int i = 0;

    for (var element in _makananList) {
      if (idMakanan == element.id) {
        _makananList.elementAt(i).jmlPesan++;
        _makananList.elementAt(i).jmlPesan * _makananList.elementAt(i).harga;
        _makananList.elementAt(i).total = _makananList.elementAt(i).jmlPesan *
            _makananList.elementAt(i).harga;
        if (0 < element.jmlPesan && element.jmlPesan == 1) {
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

