class AppStatus {
  final int id;
  final String status;

  AppStatus({required this.id, required this.status});

  factory AppStatus.fromJson(Map<String, dynamic> json) {
    return AppStatus(
      id: int.tryParse(json['id'].toString()) ?? 0,
      status: json['status'] ?? '',
    );
  }
}
