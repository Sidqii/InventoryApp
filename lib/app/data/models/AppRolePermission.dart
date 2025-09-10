class AppRolePermission {
  final int id;
  final int roleId;
  final int permId;

  AppRolePermission({
    required this.id,
    required this.roleId,
    required this.permId,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'id_peran': roleId, 'id_akses': permId};
  }

  factory AppRolePermission.fromJson(Map<String, dynamic> json) {
    return AppRolePermission(
      id: int.tryParse(json['id'].toString()) ?? 0,
      roleId: int.tryParse(json['id_peran'].toString()) ?? 0,
      permId: int.tryParse(json['id_akses'].toString()) ?? 0,
    );
  }
}
