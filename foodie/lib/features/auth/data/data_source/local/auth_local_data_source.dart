import 'package:dartz/dartz.dart';
import 'package:finalproject/core/failure/failure.dart';
import 'package:finalproject/features/auth/data/model/auth_api_model.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalDataSourceProvider = Provider(
      (ref) => AuthLocalDataSource(
    ref.read(authApiModelProvider),
  ),
);

class AuthLocalDataSource {
  final AuthApiModel _authApiModel;

  AuthLocalDataSource(this._authApiModel);

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      // Replace with actual implementation to fetch user data from local storage
      AuthApiModel? user = await _fetchUserByEmailAndPassword(email, password);
      if (user != null) {
        return const Right(true);
      } else {
        return Left(Failure(error: 'User not found'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> registerUser(AuthEntity userDetails) async {
    try {
      // Replace with actual implementation to save user data to local storage
      await _saveUser(_authApiModel.fromEntity(userDetails));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<AuthApiModel?> _fetchUserByEmailAndPassword(String email, String password) async {
    // Replace this with your actual implementation to fetch the user
    // For example, using shared preferences, SQLite, or any other local storage method
    return null; // Placeholder
  }

  Future<void> _saveUser(AuthApiModel user) async {
    // Replace this with your actual implementation to save the user
    // For example, using shared preferences, SQLite, or any other local storage method
  }
}
