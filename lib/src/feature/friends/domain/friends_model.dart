// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class FriendsModel {
  final String id;
  final String name;
  final int state;
  final bool isLoading;
  FriendsModel({
    required this.id,
    required this.name,
    required this.state,
    required this.isLoading,
  });

  FriendsModel copyWith({
    String? id,
    String? name,
    int? state,
    bool? isLoading,
  }) {
    return FriendsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state': state,
      'isLoading': isLoading,
    };
  }

  factory FriendsModel.fromMap(Map<String, dynamic> map) {
    return FriendsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      state: map['state'] as int,
      isLoading: map['isLoading'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendsModel.fromJson(String source) =>
      FriendsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FriendsModel(id: $id, name: $name, state: $state, isLoading: $isLoading)';
  }

  @override
  bool operator ==(covariant FriendsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.state == state &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ state.hashCode ^ isLoading.hashCode;
  }
}
