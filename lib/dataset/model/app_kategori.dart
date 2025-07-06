class AppKategoriModel {
  final int id;
  final String kategori;

  AppKategoriModel({
    required this.id,
    required this.kategori,
  });

  factory AppKategoriModel.fromJson(Map<String, dynamic> json) {
    return AppKategoriModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kategori: json['kategori'] ?? '',
    );
  }
}
