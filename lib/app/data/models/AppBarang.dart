import 'package:inven/app/data/models/AppJenis.dart';
import 'package:inven/app/data/models/AppKategori.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';

class AppBarang {
  final int id;
  final String nmBarang;
  final String kdBarang;
  final int kategoriId;
  final int jenisId;
  final String merk;
  final String? spkBarang;
  final String? deskripsi;
  final String pengadaan;
  final int garansi;
  final String sumBarang;
  final String vendor;

  //relasi
  final String? note;
  final AppKategori? kategori;
  final AppJenis? jenis;
  final List<AppUnitBarang>? unitBarang;

  AppBarang({
    required this.id,
    required this.nmBarang,
    required this.kdBarang,
    required this.kategoriId,
    required this.jenisId,
    required this.merk,
    this.spkBarang,
    this.deskripsi,
    required this.pengadaan,
    required this.garansi,
    required this.sumBarang,
    required this.vendor,
    this.note,
    this.kategori,
    this.jenis,
    this.unitBarang,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama_barang': nmBarang,
      'id_kategori': kategoriId,
      'id_jenis': jenisId,
      'merk': merk,
      'spek_barang': spkBarang,
      'deskripsi': deskripsi,
      'vendor': vendor,
      'note_perawatan': note,
    };
  }

  factory AppBarang.fromJson(Map<String, dynamic> json) {
    return AppBarang(
      id: int.tryParse(json['id'].toString()) ?? 0,
      nmBarang: json['nama_barang'] ?? '',
      kdBarang: json['kode_barang'] ?? '',
      kategoriId: int.tryParse(json['id_kategori'].toString()) ?? 0,
      jenisId: int.tryParse(json['id_jenis'].toString()) ?? 0,
      merk: json['merk'] ?? '',
      spkBarang: json['spek_barang'],
      deskripsi: json['deskripsi'],
      pengadaan: json['tgl_pengadaan'] ?? '',
      garansi: int.tryParse(json['garansi'].toString()) ?? 0,
      sumBarang: json['sumber_barang'] ?? '',
      vendor: json['vendor'] ?? '',
      note: json['note_perawatan'],
      kategori: json['kategori'] != null
          ? AppKategori.fromJson(json['kategori'])
          : null,
      jenis: json['jenis'] != null ? AppJenis.fromJson(json['jenis']) : null,
      unitBarang: json['unit_barang'] != null
          ? (json['unit_barang'] as List).map((e) {
              return AppUnitBarang.fromJson(e);
            }).toList()
          : null,
    );
  }
}
