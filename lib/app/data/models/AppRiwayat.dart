import 'AppLokasi.dart';
import 'AppPengajuan.dart';
import 'AppStatus.dart';
import 'AppUnitBarang.dart';

class AppRiwayat {
  final int id;
  final int unit;
  final int pengajuanId;
  final String? kodePinjam;
  final String? oleh;
  final int statAwalId;
  final int statBaruId;
  final int lokasiId;

  //relasi
  final AppUnitBarang? unitBarang;
  final AppStatus? statusAwal;
  final AppStatus? statusBaru;
  final AppLokasi? lokasi;
  final AppPengajuan? pengajuan;

  AppRiwayat({
    required this.id,
    required this.unit,
    required this.pengajuanId,
    required this.statAwalId,
    required this.statBaruId,
    required this.lokasiId,
    this.kodePinjam,
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
      unit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
      pengajuanId: int.tryParse(json['id_pengajuan'].toString()) ?? 0,
      statAwalId: int.tryParse(json['status_awal'].toString()) ?? 0,
      statBaruId: int.tryParse(json['status_baru'].toString()) ?? 0,
      lokasiId: int.tryParse(json['lokasi_unit'].toString()) ?? 0,
      kodePinjam: json['kode_pinjam'],
      oleh: json['oleh'],
      unitBarang: json['unit_barang'] != null
          ? AppUnitBarang.fromJson(json['unit_barang'])
          : null,
      pengajuan: json['pengajuan'] != null
          ? AppPengajuan.fromJson(json['pengajuan'])
          : null,
    );
  }
}
