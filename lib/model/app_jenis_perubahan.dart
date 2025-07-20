class AppJenisPerubahanModel {
  final int id;
  final String kode;
  final String label;

  AppJenisPerubahanModel({
    required this.id,
    required this.kode,
    required this.label,
  });

  factory AppJenisPerubahanModel.fromJson(Map<String, dynamic> json) {
    return AppJenisPerubahanModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kode: json['kode'] ?? '',
      label: json['label'] ?? '',
    );
  }
}
