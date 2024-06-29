import 'package:dartz/dartz.dart';
import 'package:finalproject/core/common/internet_checker/internet_checker_view.dart';
import 'package:finalproject/core/failure/failure.dart';
import 'package:finalproject/features/auth/data/repository/auth_local_repository.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_remote_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final checkConnectivity = ref.read(connectivityStatusProvider);

  if(checkConnectivity == ConnectivityStatus.isConnected){
    return ref.read(authLocalRepositoryProvider);
  }else{
    return ref.read(authLocalRepositoryProvider);
  }
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
