class AppPermission {
  final int id;
  final String akses;

  AppPermission({required this.id, required this.akses});

  factory AppPermission.fromJson(Map<String, dynamic> json) {
    return AppPermission(
      id: int.tryParse(json['id'].toString()) ?? 0,
      akses: json['hak_akses'] ?? '',
    );
  }
}
