class AppJenisModel {
  final int id;
  final String jenis;

  AppJenisModel({
    required this.id,
    required this.jenis,
  });

  factory AppJenisModel.fromJson(Map<String, dynamic> json) {
    return AppJenisModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      jenis: json['jenis'] ?? '',
    );
  }
}
