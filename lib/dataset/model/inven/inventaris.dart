class InvenModels {
  final int id;
  final int stok;
  final int jumbaik;
  final int jumrusak;
  final int jumrawat;
  final int jumpinjam;
  final String barang;
  final String kategori;
  final String lokasi;
  final String seri;
  final String dibuat;
  final String pengadaan;

  InvenModels({
    required this.id,
    required this.stok,
    required this.jumbaik,
    required this.jumrusak,
    required this.jumrawat,
    required this.jumpinjam,
    required this.barang,
    required this.kategori,
    required this.lokasi,
    required this.seri,
    required this.dibuat,
    required this.pengadaan,
  });

  factory InvenModels.fromJson(Map<String, dynamic> json) {
    return InvenModels(
      id: int.tryParse(json['id']) ?? 0,
      stok: int.tryParse(json['stok']) ?? 0,
      jumbaik: int.tryParse(json['jum_baik']) ?? 0,
      jumrusak: int.tryParse(json['jum_rusak']) ?? 0,
      jumrawat: int.tryParse(json['jum_rawat']) ?? 0,
      jumpinjam: int.tryParse(json['jum_pinjam']) ?? 0,
      barang: json['nama_barang'] ?? '',
      kategori: json['nama_kategori'] ?? '',
      lokasi: json['nama_lokasi'] ?? '',
      seri: json['no_seri'] ?? '',
      dibuat: json['created_at'] ?? '',
      pengadaan: json['pengadaan'] ?? '',
    );
  }
}
