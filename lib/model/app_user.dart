class AppUserModel {
  final int id;
  final String email;
  final int? role;
  final String? nama;

  AppUserModel({
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

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      id: json['id'],
      email: json['email'],
      role: json['role_id'],
      nama: json['nama']
    );
  }
}
