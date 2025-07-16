class AppStatusPengajuanModel {
  final int id;
  final String? kode;
  final String? label;

  AppStatusPengajuanModel({
    required this.id,
    this.kode,
    this.label,
  });

  factory AppStatusPengajuanModel.fromJson(Map<String, dynamic> json) {
    return AppStatusPengajuanModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kode: json['kode'] ?? '',
      label: json['label'] ?? '',
    );
  }
}
