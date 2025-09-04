import 'AppRiwayat.dart';
import 'AppStatus.dart';
import 'AppUnitBarang.dart';
import 'AppUser.dart';

class AppPengajuan {
  final int id;
  final int pengguna;
  final String? instansi;
  final String? hal;
  final String pinjam;
  final String kembali;
  final int jumlah;

  //relasi
  final List<AppUnitBarang>? unitBarang;
  final List<AppRiwayat>? riwayat;
  final AppUser? user;
  final AppStatus? status;

  AppPengajuan({
    required this.id,
    required this.pengguna,
    required this.pinjam,
    required this.kembali,
    required this.jumlah,
    this.hal,
    this.instansi,
    this.user,
    this.status,
    this.riwayat,
    this.unitBarang,
  });

  factory AppPengajuan.fromJson(Map<String, dynamic> json) {
    return AppPengajuan(
      id: int.tryParse(json['id'].toString()) ?? 0,
      pengguna: int.tryParse(json['id_pengguna'].toString()) ?? 0,
      status: json['status'] != null
          ? AppStatus.fromJson(json['status'])
          : null,
      instansi: json['instansi'] ?? '',
      pinjam: json['tgl_pinjam'] ?? '',
      kembali: json['tgl_kembali'] ?? '',
      jumlah: int.tryParse(json['jumlah'].toString()) ?? 0,
      hal: json['hal'],
      user: json['user'] != null ? AppUser.fromJson(json['user']) : null,
      unitBarang: json['unit_barang'] != null
          ? (json['unit_barang'] as List).map((e) {
              return AppUnitBarang.fromJson(e);
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
