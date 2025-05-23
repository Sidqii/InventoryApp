class ItemModels {
  final int id;
  final String namaBarang;
  final String kategori;
  final int harga;
  final String stok;
  final String namaLokasi;
  final String status;
  final String tglDibuat;

  ItemModels({
    required this.id,
    required this.namaBarang,
    required this.kategori,
    required this.harga,
    required this.stok,
    required this.namaLokasi,
    required this.status,
    required this.tglDibuat,
  });

  factory ItemModels.fromJson(Map<String, dynamic> json) {
    return ItemModels(
      id: int.tryParse(json['id'].toString()) ?? 0,
      namaBarang: json['nama_barang'] ?? '',
      kategori: json['nama_kategori'] ?? '',
      harga: int.tryParse(json['harga'].toString()) ?? 0,
      stok: json['stok'] ?? '',
      namaLokasi: json['nama_lokasi'] ?? '',
      status: json['status'] ?? '',
      tglDibuat: json['created_at'] ?? '',
    );
  }
}
