class AppPengajuanModel {
  final int id;
  final int unit;
  final int pengguna;
  final int status;
  final String? instansi;
  final String hal;
  final int jumlah;
  final String pinjam;
  final String? kembali;

  AppPengajuanModel({
    required this.id,
    required this.unit,
    required this.pengguna,
    required this.status,
    this.instansi,
    required this.hal,
    required this.jumlah,
    required this.pinjam,
    this.kembali,
  });

  factory AppPengajuanModel.fromJson(Map<String, dynamic> json) {
    return AppPengajuanModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      unit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
      pengguna: int.tryParse(json['id_pengguna'].toString()) ?? 0,
      status: int.tryParse(json['id_status'].toString()) ?? 0,
      instansi: json['instansi'] ?? '',
      hal: json['hal'] ?? '',
      jumlah: int.tryParse(json['jumlah'].toString()) ?? 0,
      pinjam: json['tanggal_pinjam'] ?? '',
      kembali: json['tanggal_kembali'] ?? '',
    );
  }
}
