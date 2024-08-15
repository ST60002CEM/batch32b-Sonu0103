import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>(
      (ref) => AuthApiModel.empty(),
);

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? id;

  final String name;
  final String email;
  final String? password;

  AuthApiModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
  });

  // Empty constructor
  AuthApiModel.empty()
      : id = '',
        name = '',
        email = '',
        password = '';

  factory AuthApiModel.fromJson(Map<String, dynamic> json) => _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      name: name,
      email: email,
      password: password ?? '',
    );
  }

  AuthApiModel fromEntity(AuthEntity entity) => AuthApiModel(
    id: entity.id,
    name: entity.name,
    email: entity.email,
    password: entity.password,
  );
}
