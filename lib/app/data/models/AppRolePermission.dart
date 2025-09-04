class AppRolePermission {
  final int id;
  final int idRole;
  final int idPerm;

  AppRolePermission({
    required this.id,
    required this.idRole,
    required this.idPerm,
  });

  factory AppRolePermission.fromJson(Map<String, dynamic> json) {
    return AppRolePermission(
      id: int.tryParse(json['id'].toString()) ?? 0,
      idRole: int.tryParse(json['id_peran'].toString()) ?? 0,
      idPerm: int.tryParse(json['id_akses'].toString()) ?? 0,
    );
  }
}
