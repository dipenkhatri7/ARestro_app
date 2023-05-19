import 'dart:convert';

class User {
  final String name;
  final String email;
  final num phoneNumber;
  final String password;
  late final String token;
  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.token,
  });
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      // id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? 0,
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
