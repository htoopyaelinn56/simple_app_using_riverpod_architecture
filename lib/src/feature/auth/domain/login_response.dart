// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponse {
  final String name;
  final String phone;
  final String token;
  LoginResponse({
    required this.name,
    required this.phone,
    required this.token,
  });

  LoginResponse copyWith({
    String? name,
    String? phone,
    String? token,
  }) {
    return LoginResponse(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      name: map['name'] as String,
      phone: map['phone'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponse(name: $name, phone: $phone, token: $token)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.name == name && other.phone == phone && other.token == token;
  }

  @override
  int get hashCode => name.hashCode ^ phone.hashCode ^ token.hashCode;
}
