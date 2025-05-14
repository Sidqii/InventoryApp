class usersModels {
  final int id;
  final String email;
  final String pass;
  final String avatar;

  usersModels({
    required this.id,
    required this.email,
    required this.pass,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': pass,
      'avatar': avatar,
    };
  }

  factory usersModels.fromJson(Map<String, dynamic> json) {
    return usersModels(
      id: json['id'],
      email: json['email'],
      pass: json['pass'],
      avatar: json['avatar'],
    );
  }
}
