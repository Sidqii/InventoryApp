import 'package:pusdatin_end/model/app_pengajuan.dart';

import 'app_jenis_perubahan.dart';
import 'app_user.dart';
import 'app_unit.dart';

class AppPersetujuanModel {
  final int id;
  final int idunit;
  final int idperubahan;
  final int statusawal;
  final int statusbaru;
  final int lokasiawal;
  final int? lokasibaru;
  final String tanggal;
  final int? oleh;
  final String? catatan;
  final String? lampiran;
  final int? idpengajuan;

  final AppUnitModel? modelunit;
  final AppPengajuanModel? modelreqq;
  final AppJenisPerubahanModel? modeljenis;
  final AppUserModel? modeluser;
  final AppUserModel? modelpeminjam;

  final String? namapeminjam;

  AppPersetujuanModel({
    required this.id,
    required this.idunit,
    required this.idperubahan,
    required this.statusawal,
    required this.statusbaru,
    required this.lokasiawal,
    this.lokasibaru,
    required this.tanggal,
    this.oleh,
    this.catatan,
    this.lampiran,
    this.idpengajuan,
    this.modelunit,
    this.modeljenis,
    this.modeluser,
    this.namapeminjam,
    this.modelreqq,
    this.modelpeminjam,
  });

  factory AppPersetujuanModel.fromJson(Map<String, dynamic> json) {
    return AppPersetujuanModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      idunit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
      idperubahan: int.tryParse(json['id_jenis_perubahan'].toString()) ?? 0,
      statusawal: int.tryParse(json['status_awal'].toString()) ?? 0,
      statusbaru: int.tryParse(json['status_baru'].toString()) ?? 0,
      lokasiawal: int.tryParse(json['lokasi_awal'].toString()) ?? 0,
      lokasibaru: int.tryParse(json['lokasi_baru'].toString()) ?? 0,
      tanggal: json['tanggal'] ?? '',
      oleh: int.tryParse(json['oleh'].toString()) ?? 0,
      catatan: json['catatan'] ?? '',
      lampiran: json['lampiran'] ?? '',
      idpengajuan: int.tryParse(json['id_pengajuan'].toString()) ?? 0,
      modelunit:
          json['unit'] != null ? AppUnitModel.fromJson(json['unit']) : null,
      modeljenis: json['jenis'] != null
          ? AppJenisPerubahanModel.fromJson(json['jenis'])
          : null,
      modeluser:
          json['user'] != null ? AppUserModel.fromJson(json['user']) : null,
      namapeminjam: json['pengajuan']?['peminjam']?['nama'],
      modelreqq: json['pengajuan'] != null
          ? AppPengajuanModel.fromJson(json['pengajuan'])
          : null,
      modelpeminjam: json['pengajuan']?['peminjam'] != null
          ? AppUserModel.fromJson(json['pengajuan']['peminjam'])
          : null,
    );
  }
}
