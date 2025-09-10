import 'AppStatusUnit.dart';
import 'AppPengajuan.dart';
import 'AppRiwayat.dart';
import 'AppBarang.dart';
import 'AppKepemilikan.dart';
import 'AppKondisi.dart';
import 'AppLokasi.dart';

class AppUnitBarang {
  final int id;
  final String kdUnit;
  final String noSeri;
  final String? foto;

  //relasi
  final AppBarang? barang;
  final AppKepemilikan? kepemilikan;
  final AppStatusUnit? status;
  final AppLokasi? lokasi;
  final AppKondisi? kondisi;
  final List<AppPengajuan>? pengajuan;
  final List<AppRiwayat>? riwayat;

  AppUnitBarang({
    required this.id,
    required this.kdUnit,
    required this.noSeri,
    this.foto,
    this.barang,
    this.kepemilikan,
    this.status,
    this.lokasi,
    this.kondisi,
    this.pengajuan,
    this.riwayat,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_unit': kdUnit,
      'no_seri': noSeri,
      'foto': foto,
      'barang': barang?.toJson(),
      'kepemilikan': kepemilikan?.toJson(),
      'status': status?.toJson(),
      'lokasi': lokasi?.toJson(),
      'kondisi': kondisi?.toJson(),
      'pengajuan': pengajuan?.map((p) => p.toJson()).toList(),
      'riwayat': riwayat?.map((r) => r.toJson()).toList(),
    };
  }

  factory AppUnitBarang.fromJson(Map<String, dynamic> json) {
    return AppUnitBarang(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kdUnit: json['kode_unit'] ?? '',
      noSeri: json['no_seri'] ?? '',
      foto: json['foto'],
      barang: json['barang'] != null
          ? AppBarang.fromJson(json['barang'])
          : null,
      kepemilikan: json['kepemilikan'] != null
          ? AppKepemilikan.fromJson(json['kepemilikan'])
          : null,
      status: json['status'] != null
          ? AppStatusUnit.fromJson(json['status'])
          : null,
      lokasi: json['lokasi'] != null
          ? AppLokasi.fromJson(json['lokasi'])
          : null,
      kondisi: json['kondisi'] != null
          ? AppKondisi.fromJson(json['kondisi'])
          : null,
      pengajuan: json['pengajuan'] != null
          ? (json['pengajuan'] as List).map((e) {
              return AppPengajuan.fromJson(e);
            }).toList()
          : null,
      riwayat: json['riwayat'] != null
          ? (json['riwayat'] as List).map((e) {
              return AppRiwayat.fromJson(e);
            }).toList()
          : null,
    );
  }
}
