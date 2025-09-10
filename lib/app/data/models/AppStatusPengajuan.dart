class AppStatusPengajuan {
  final int id;
  final String pStatus;

  AppStatusPengajuan({required this.id, required this.pStatus});

  Map<String, dynamic> toJson() {
    return {'id': id, 'status_pengajuan': pStatus};
  }

  factory AppStatusPengajuan.fromJson(Map<String, dynamic> json) {
    return AppStatusPengajuan(
      id: int.tryParse(json['id'].toString()) ?? 0,
      pStatus: json['status_pengajuan'] ?? '',
    );
  }
}
