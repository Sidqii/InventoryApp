class AppKategori {
  final int id;
  final String kategori;

  AppKategori({required this.id, required this.kategori});

  Map<String, dynamic> toJson() {
    return {'id': id, 'kategori': kategori};
  }

  factory AppKategori.fromJson(Map<String, dynamic> json) {
    return AppKategori(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kategori: json['kategori'] ?? '',
    );
  }
}
