class AppKepemilikan {
  final int id;
  final String kepemilikan;

  AppKepemilikan({required this.id, required this.kepemilikan});

  Map<String, dynamic> toJson() {
    return {'id': id, 'jenis_kepemilikan': kepemilikan};
  }

  factory AppKepemilikan.fromJson(Map<String, dynamic> json) {
    return AppKepemilikan(
      id: int.tryParse(json['id'].toString()) ?? 0,
      kepemilikan: json['jenis_kepemmilikan'] ?? '',
    );
  }
}
