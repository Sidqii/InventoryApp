class AppLokasi {
  final int id;
  final String nmLokasi;
  final String kdLokasi;
  final String? keterangan;

  AppLokasi({
    required this.id,
    required this.nmLokasi,
    required this.kdLokasi,
    this.keterangan,
  });

  factory AppLokasi.fromJson(Map<String, dynamic> json) {
    return AppLokasi(
      id: int.tryParse(json['id'].toString()) ?? 0,
      nmLokasi: json['nama_lokasi'] ?? '',
      kdLokasi: json['kode_lokasi'] ?? '',
      keterangan: json['keterangan'],
    );
  }
}
