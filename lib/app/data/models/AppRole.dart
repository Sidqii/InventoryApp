class AppRole {
  final int id;
  final String peran;

  AppRole({required this.id, required this.peran});

  factory AppRole.fromJson(Map<String, dynamic> json) {
    return AppRole(
      id: int.tryParse(json['id'].toString()) ?? 0,
      peran: json['peran'] ?? '',
    );
  }
}
