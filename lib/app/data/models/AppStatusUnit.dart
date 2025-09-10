class AppStatusUnit {
  final int id;
  final String uStatus;

  AppStatusUnit({required this.id, required this.uStatus});

  Map<String, dynamic> toJson() {
    return {'id': id, 'status_unit': uStatus};
  }

  factory AppStatusUnit.fromJson(Map<String, dynamic> json) {
    return AppStatusUnit(
      id: int.tryParse(json['id'].toString()) ?? 0,
      uStatus: json['status_unit'] ?? '',
    );
  }
}
