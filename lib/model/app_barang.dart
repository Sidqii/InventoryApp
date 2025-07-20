import 'app_jenis.dart';
import 'app_kategori.dart';

class AppBarangModel {
  final int id;
  final String barang;
  final String kode;
  final String merk;
  final String deskripsi;
  final Map<String, dynamic> spesifikasi;
  final String pengadaan;
  final int garansi;
  final String sumber;
  final String vendor;
  final int total;
  final String note;
  final String createdAt;
  final String updatedAt;
  final AppKategoriModel kategori;
  final AppJenisModel jenis;

  AppBarangModel({
    required this.id,
    required this.barang,
    required this.kode,
    required this.merk,
    required this.deskripsi,
    required this.spesifikasi,
    required this.pengadaan,
    required this.garansi,
    required this.sumber,
    required this.vendor,
    required this.total,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.kategori,
    required this.jenis,
  });

  factory AppBarangModel.fromJson(Map<String, dynamic> json) {
    return AppBarangModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      barang: json['nama_barang'] ?? '',
      kode: json['kode_barang'] ?? '',
      merk: json['merk'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      spesifikasi: json['spesifikasi_teknis'] ?? {},
      pengadaan: json['tanggal_pengadaan'] ?? '',
      garansi: int.tryParse(json['masa_garansi'].toString()) ?? 0,
      sumber: json['sumber_pengadaan'] ?? '',
      vendor: json['vendor'] ?? '',
      total: int.tryParse(json['jumlah_total_unit'].toString()) ?? 0,
      note: json['catatan_perawatan'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      kategori: AppKategoriModel.fromJson(json['kategori'] ?? {}),
      jenis: AppJenisModel.fromJson(json['jenis'] ?? {}),
    );
  }
}
