// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final int id;
  final String name;
  final bool favourite;
  PostModel({
    required this.id,
    required this.name,
    required this.favourite,
  });

  PostModel copyWith({
    int? id,
    String? name,
    bool? favourite,
  }) {
    return PostModel(
      id: id ?? this.id,
      name: name ?? this.name,
      favourite: favourite ?? this.favourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'favourite': favourite,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as int,
      name: map['name'] as String,
      favourite: map['favourite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostModel(id: $id, name: $name, favourite: $favourite)';

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.favourite == favourite;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ favourite.hashCode;
}
