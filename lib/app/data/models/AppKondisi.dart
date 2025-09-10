class AppKondisi {
  final int id;
  final String kondisi;

  AppKondisi({required this.id, required this.kondisi});

  Map<String, dynamic> toJson() {
    return {'id': id, 'kondisi': kondisi};
  }

  factory AppKondisi.fromJson(Map<String, dynamic> json) {
    return AppKondisi(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kondisi: json['kondisi'] ?? '',
    );
  }
}
