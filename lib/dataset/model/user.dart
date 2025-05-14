class usersModels {
  final int id;
  final String email;
  final int? role;
  final String? username;

  usersModels({
    required this.id,
    required this.email,
    this.role,
    this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role_id': role,
      'username': username,
    };
  }

  factory usersModels.fromJson(Map<String, dynamic> json) {
    return usersModels(
      id: json['id'],
      email: json['email'],
      role: json['role_id'],
      username: json['username']
    );
  }
}
