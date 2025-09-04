import 'package:inven/app/data/models/AppUnitBarang.dart';

class AppPengembalian {
  final int id;
  final String kdPinjam;
  final String nmBarang;
  final String status;
  final String tglKembali;

  final List<AppUnitBarang>? unit;

  AppPengembalian({
    required this.id,
    required this.kdPinjam,
    required this.nmBarang,
    required this.status,
    required this.tglKembali,
    this.unit,
  });

  factory AppPengembalian.fromJson(Map<String, dynamic> json) {
    return AppPengembalian(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kdPinjam: json['kode_pinjam'] ?? '',
      nmBarang: json['nama_barang'] ?? '',
      status: json['status'] ?? '',
      tglKembali: json['pengembalian'] ?? '',
      unit: json['unit'] != null
          ? (json['unit'] as List).map((e) {
              return AppUnitBarang.fromJson(e);
            }).toList()
          : null,
    );
  }
}
