import 'package:inven/app/data/models/AppRiwayat.dart';
import 'package:inven/app/data/models/AppStatusPengajuan.dart';
import 'package:inven/app/data/models/AppUnitBarang.dart';
import 'package:inven/app/data/models/AppUser.dart';

class AppPengajuan {
  final int id;
  final int penggunaId;
  final int statusId;
  final String instansi;
  final String? hal;
  final String pinjamTgl;
  final String kembaliTgl;
  final int jumlah;

  final AppUser? pengguna;
  final List<AppUnitBarang>? unit;
  final AppStatusPengajuan? status;
  final List<AppRiwayat>? riwayat;

  AppPengajuan({
    required this.id,
    required this.penggunaId,
    required this.statusId,
    required this.instansi,
    this.hal,
    required this.pinjamTgl,
    required this.kembaliTgl,
    required this.jumlah,
    this.pengguna,
    this.unit,
    this.status,
    this.riwayat,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_pengguna': penggunaId,
      'id_status': statusId,
      'instansi': instansi,
      'hal': hal,
      'tgl_pinjam': pinjamTgl,
      'tgl_kembali': kembaliTgl,
      'jumlah': jumlah,
      'user': pengguna?.toJson(),
      'unit': unit?.map((u)=>u.toJson()).toList(),
      'status':status?.toJson(),
      'riwayat':riwayat?.map((r)=>toJson()).toList(),
    };
  }

  factory AppPengajuan.fromJson(Map<String, dynamic> json) {
    return AppPengajuan(
      id: int.tryParse(json['id'].toString()) ?? 0,
      penggunaId: int.tryParse(json['id_pengguna'].toString()) ?? 0,
      statusId: int.tryParse(json['id_status'].toString()) ?? 0,
      instansi: json['instansi'] ?? '',
      hal: json['hal'],
      pinjamTgl: json['tgl_pinjam'] ?? '',
      kembaliTgl: json['tgl_kembali'] ?? '',
      jumlah: int.tryParse(json['jumlah'].toString()) ?? 0,
      pengguna: json['user'] != null ? AppUser.fromJson(json['user']) : null,
      unit: json['unit_barang'] != null
          ? (json['unit_barang'] as List).map((e) {
              return AppUnitBarang.fromJson(e);
            }).toList()
          : null,
      status: json['status'] != null
          ? AppStatusPengajuan.fromJson(json['status'])
          : null,
      riwayat: json['riwayat'] != null
          ? (json['riwayat'] as List).map((e) {
              return AppRiwayat.fromJson(e);
            }).toList()
          : null,
    );
  }
}
