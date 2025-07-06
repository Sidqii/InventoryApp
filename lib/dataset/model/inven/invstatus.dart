class Invstatus {
  final int id;
  final String status;

  Invstatus({
    required this.id,
    required this.status,
  });

  factory Invstatus.fromJson(Map<String, dynamic> json) {
    return Invstatus(
      id: int.tryParse(json['id'].toString()) ?? 0,
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
    };
  }
}
