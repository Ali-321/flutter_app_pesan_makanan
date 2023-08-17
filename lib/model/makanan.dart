class Makanan {
  String id;
  final String gambar;
  final String nama;
  final int harga;
  final String deskripsi;

  Makanan({
    this.id = '',
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.deskripsi,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'gambar': gambar,
        'harga': harga,
        'deskripsi': deskripsi
      };

  static Makanan fromJson(Map<String, dynamic> json) => Makanan(
      id: json['id'],
      gambar: json['gambar'],
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi']);
}
