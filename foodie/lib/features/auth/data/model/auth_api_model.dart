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

  final String firstName;

  final String lastName;

  final String email;

  final String? password;

  AuthApiModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  // Empty constructor
  AuthApiModel.empty()
      : id = '',
        firstName = '',
        lastName = '',
        email = '',
        password = '';

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
     _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,

      password: password ?? '',
    );
  }

  AuthApiModel fromEntity(AuthEntity entity) => AuthApiModel(firstName: entity.firstName, lastName: entity.lastName, email: entity.email, password:entity.password,);
}
