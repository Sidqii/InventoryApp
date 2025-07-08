class PenggunaModel {
  final int id;
  final String email;
  final int? role;
  final String? nama;

  PenggunaModel({
    required this.id,
    required this.email,
    this.role,
    this.nama,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role_id': role,
      'nama': nama,
    };
  }

  factory PenggunaModel.fromJson(Map<String, dynamic> json) {
    return PenggunaModel(
      id: json['id'],
      email: json['email'],
      role: json['role_id'],
      nama: json['nama']
    );
  }
}
