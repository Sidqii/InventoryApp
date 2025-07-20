import 'package:pusdatin_end/model/app_user.dart';

class AppPengajuanModel {
  final int id;
  final String? instansi;
  final int? jumlah;
  final String? kembali;
  final String? hal;
  final AppUserModel? peminjam;

  AppPengajuanModel({
    required this.id,
    this.instansi,
    this.jumlah,
    this.kembali,
    this.hal,
    this.peminjam,
  });

  factory AppPengajuanModel.fromJson(Map<String, dynamic> json) {
    return AppPengajuanModel(
      id: json['id'],
      instansi: json['instansi'],
      jumlah: json['jumlah'],
      kembali: json['tanggal_kembali'],
      hal: json['hal'],
      peminjam: json['peminjam'] != null
          ? AppUserModel.fromJson(json['peminjam'])
          : null,
    );
  }
}
