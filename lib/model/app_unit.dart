import 'package:pusdatin_end/model/app_barang.dart';

class AppUnitModel {
  final int id;
  final int barang;
  final int kepemilikan;
  final String kode;
  final String? seri;
  final int kondisi;
  final int status;
  final int lokasi;
  final String? terima;
  final String? keterangan;
  final String? foto;
  final AppBarangModel? produk;

  AppUnitModel({
    required this.id,
    required this.barang,
    required this.kepemilikan,
    required this.kode,
    this.seri,
    required this.kondisi,
    required this.status,
    required this.lokasi,
    this.terima,
    this.keterangan,
    this.foto,
    this.produk,
  });

  factory AppUnitModel.fromJson(Map<String, dynamic> json) {
    return AppUnitModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      barang: int.tryParse(json['id_barang'].toString()) ?? 0,
      kepemilikan: int.tryParse(json['id_kepemilikan'].toString()) ?? 0,
      kode: json['kode_unit'] ?? '',
      seri: json['no_seri'] ?? '',
      kondisi: int.tryParse(json['id_kondisi'].toString()) ?? 0,
      status: int.tryParse(json['id_status'].toString()) ?? 0,
      lokasi: int.tryParse(json['id_lokasi'].toString()) ?? 0,
      terima: json['tgl_terima'] ?? '',
      keterangan: json['ket_unit'] ?? '',
      foto: json['foto'] ?? '',
      produk: json['barang'] != null
          ? AppBarangModel.fromJson(json['barang'])
          : null,
    );
  }
}
