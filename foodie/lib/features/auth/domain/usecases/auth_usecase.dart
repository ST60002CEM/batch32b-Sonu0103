import 'package:dartz/dartz.dart';
import 'package:finalproject/core/failure/failure.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';
import 'package:finalproject/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(ref.read(authRepositoryProvider));
});

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerUser(AuthEntity student) async {
    return await _authRepository.registerUser(student);
  }

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    return await _authRepository.loginUser(email, password);
  }
}
