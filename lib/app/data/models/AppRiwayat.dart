import 'AppLokasi.dart';
import 'AppPengajuan.dart';
import 'AppStatus.dart';
import 'AppUnitBarang.dart';

class AppRiwayat {
  final int id;
  final int idUnit;
  final int idPengajuan;
  final int statAwal;
  final int statBaru;
  final int lokasiUnit;
  final String? oleh;

  //relasi
  final AppUnitBarang? unitBarang;
  final AppStatus? statusAwal;
  final AppStatus? statusBaru;
  final AppLokasi? lokasi;
  final AppPengajuan? pengajuan;

  AppRiwayat({
    required this.id,
    required this.idUnit,
    required this.idPengajuan,
    required this.statAwal,
    required this.statBaru,
    required this.lokasiUnit,
    this.oleh,
    this.unitBarang,
    this.statusAwal,
    this.statusBaru,
    this.lokasi,
    this.pengajuan,
  });

  factory AppRiwayat.fromJson(Map<String, dynamic> json) {
    return AppRiwayat(
      id: int.tryParse(json['id'].toString()) ?? 0,
      idUnit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
      idPengajuan: int.tryParse(json['id_pengajuan'].toString()) ?? 0,
      statAwal: int.tryParse(json['status_awal'].toString()) ?? 0,
      statBaru: int.tryParse(json['status_baru'].toString()) ?? 0,
      lokasiUnit: int.tryParse(json['lokasi_unit'].toString()) ?? 0,
      oleh: json['oleh'],
    );
  }
}
