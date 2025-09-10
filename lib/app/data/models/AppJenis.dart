class AppJenis {
  final int id;
  final String jenis;

  AppJenis({required this.id, required this.jenis});

  Map<String, dynamic> toJson() {
    return {'id': id, 'jenis': jenis};
  }

  factory AppJenis.fromJson(Map<String, dynamic> json) {
    return AppJenis(
      id: int.tryParse(json['id'].toString()) ?? 0,
      jenis: json['jenis'] ?? '',
    );
  }
}
