class AppPengajuanUnit {
  final int id;
  final int idPengajuan;
  final int idUnit;

  AppPengajuanUnit({
    required this.id,
    required this.idPengajuan,
    required this.idUnit,
  });

  factory AppPengajuanUnit.fromJson(Map<String, dynamic> json) {
    return AppPengajuanUnit(
      id: int.tryParse(json['id'].toString()) ?? 0,
      idPengajuan: int.tryParse(json['id_pengajuan'].toString()) ?? 0,
      idUnit: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
    );
  }
}
