class Invlokasi {
  final int id;
  final String lokasi;

  Invlokasi({
    required this.id,
    required this.lokasi,
  });

  factory Invlokasi.fromJson(Map<String, dynamic> json) {
    return Invlokasi(
      id: int.tryParse(json['id'].toString()) ?? 0,
      lokasi: json['lokasi'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lokasi': lokasi,
    };
  }
}
