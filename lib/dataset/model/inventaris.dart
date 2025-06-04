class InvenModels {
  final int id;
  final String namaBarang;
  final String kategori;
  final int harga;
  final int stok;
  final String namaLokasi;
  final String status;
  final String tglDibuat;

  InvenModels({
    required this.id,
    required this.namaBarang,
    required this.kategori,
    required this.harga,
    required this.stok,
    required this.namaLokasi,
    required this.status,
    required this.tglDibuat,
  });

  factory InvenModels.fromJson(Map<String, dynamic> json) {
    return InvenModels(
      id: int.tryParse(json['id'].toString()) ?? 0,
      namaBarang: json['nama_barang'] ?? '',
      kategori: json['nama_kategori'] ?? '',
      harga: int.tryParse(json['harga'].toString()) ?? 0,
      stok: int.tryParse(json['stok'].toString()) ?? 0,
      namaLokasi: json['nama_lokasi'] ?? '',
      status: json['status'] ?? '',
      tglDibuat: json['created_at'] ?? '',
    );
  }
}
