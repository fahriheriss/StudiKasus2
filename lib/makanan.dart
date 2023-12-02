import 'dart:convert';

class Makanan {
  String nama;
  String deskripsi;
  String gambarUtama;
  String detail;
  String waktuBuka;
  String harga;
  String kalori;
  List<String> gambarLain;
  List<Map<String, String>> bahan;

  Makanan({
    required this.nama,
    required this.deskripsi,
    required this.gambarUtama,
    required this.detail,
    required this.waktuBuka,
    required this.harga,
    required this.kalori,
    required this.gambarLain,
    required this.bahan,
});

 factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      nama: json["nama"],
      deskripsi: json["deskripsi"],
      detail: json["detail"],
      waktuBuka: json["waktubuka"],
      harga: json["harga"],
      kalori: json["kalori"],
      gambarUtama: json["gambar"],
      gambarLain: List<String>.from(json["gambarlain"]),
      bahan: List<Map<String, String>>.from(json["bahan"].map(
          (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
    );
}
}