// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  final String name;
  final String phone;
  final String password;
  final String confirmPassword;
  RegisterModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  RegisterModel copyWith({
    String? name,
    String? phone,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(name: $name, phone: $phone, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.phone == phone && other.password == password && other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return name.hashCode ^ phone.hashCode ^ password.hashCode ^ confirmPassword.hashCode;
  }
}
