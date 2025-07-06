class Invkategori {
  final int id;
  final String kondisi;

  Invkategori({
    required this.id,
    required this.kondisi,
  });

  factory Invkategori.fromJson(Map<String, dynamic> json) {
    return Invkategori(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kondisi: json['kondisi'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kondisi': kondisi,
    };
  }
}
