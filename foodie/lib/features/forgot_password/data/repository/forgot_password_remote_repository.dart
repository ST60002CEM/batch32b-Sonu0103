import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/forgot_password_repoditory.dart';
 // Make sure this path is correct
import '../data_sorce/remote/forgot_password_remote_datasource.dart';
 // Fix the typo in the path

// Provider for ForgotPasswordRepository
final forgotPasswordRepositoryProvider = Provider<IForgotPasswordRepository>(
      (ref) => ForgotPasswordRemoteRepository(
    forgotPasswordRemoteDataSource:
    ref.read(forgotPasswordRemoteDatasourceProvider),
  ),
);

// Implementation of IForgotPasswordRepository
class ForgotPasswordRemoteRepository implements IForgotPasswordRepository {
  final ForgotPasswordRemoteDatasource forgotPasswordRemoteDataSource;

  ForgotPasswordRemoteRepository({required this.forgotPasswordRemoteDataSource});

  @override
  Future<Either<Failure, bool>> reqOtp(int number) {
    return forgotPasswordRemoteDataSource.requestOTP(number);
  }

  @override
  Future<Either<Failure, bool>> verifyOtpAndResetPassword(
      int phoneNumber, String otp, String password) {
    return forgotPasswordRemoteDataSource.verifyOtpAndResetPassword(
        phoneNumber, otp, password);
  }
}
