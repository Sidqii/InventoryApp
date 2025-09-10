class AppPengajuanUnit {
  final int id;
  final int pengajuanId;
  final int unitId;

  AppPengajuanUnit({
    required this.id,
    required this.pengajuanId,
    required this.unitId,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'id_pengajuan': pengajuanId, 'id_unit_barang': unitId};
  }

  factory AppPengajuanUnit.fromJson(Map<String, dynamic> json) {
    return AppPengajuanUnit(
      id: int.tryParse(json['id'].toString()) ?? 0,
      pengajuanId: int.tryParse(json['id_pengajuan'].toString()) ?? 0,
      unitId: int.tryParse(json['id_unit_barang'].toString()) ?? 0,
    );
  }
}
