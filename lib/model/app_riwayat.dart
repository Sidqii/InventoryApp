import 'app_status_pengajuan.dart';
import 'app_unit_detail.dart';
import 'app_user.dart';

class AppRiwayatModel {
  final int id;
  final int user;
  final int status;
  final String? instansi;
  final String? hal;
  final int jumlah;
  final String? pinjam;
  final String? kembali;
  final AppStatusPengajuanModel pengajuan;
  final List<AppUnitDetailModel> detail;
  final AppUserModel pemohon;

  AppRiwayatModel({
    required this.id,
    required this.user,
    required this.status,
    this.instansi,
    this.hal,
    required this.jumlah,
    this.pinjam,
    this.kembali,
    required this.pengajuan,
    required this.detail,
    required this.pemohon,
  });

  factory AppRiwayatModel.fromJson(Map<String, dynamic> json) {
    return AppRiwayatModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      user: int.tryParse(json['id_pengguna'].toString()) ?? 0,
      status: int.tryParse(json['id_status'].toString()) ?? 0,
      instansi: json['instansi'] ?? '',
      hal: json['hal'] ?? '',
      jumlah: int.tryParse(json['jumlah'].toString()) ?? 0,
      pinjam: json['tanggal_pinjam'] ?? '',
      kembali: json['tanggal_kembali'] ?? '',
      pengajuan: AppStatusPengajuanModel.fromJson(json['status_pengajuan']),
      detail: (json['unit_detail'] as List).map((e) {
        return AppUnitDetailModel.fromJson(e);
      }).toList(),
      pemohon: AppUserModel.fromJson(json['user']),
    );
  }
}
