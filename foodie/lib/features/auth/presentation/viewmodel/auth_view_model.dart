import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart';
import '../../../../core/common/my_snackbar.dart';
import '../../../home/presentation/navigator/dashboard_navigator.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/usecases/auth_usecase.dart';
import '../state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
      (ref) => AuthViewModel(
    ref.read(dashboardViewNavigatorProvider),
    ref.read(registerViewNavigatorProvider),
    ref.read(loginViewNavigatorProvider),
    ref.read(authUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(
      this.dnavigator,
      this.rnavigator,
      this.lnavigator,
      this.authUseCase,
      ) : super(AuthState.initial());

  final AuthUseCase authUseCase;
  final LoginViewNavigator lnavigator;
  final RegisterViewNavigator rnavigator;
  final DashboardViewNavigator dnavigator;

  Future<void> registerUser(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(user);
    data.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showMySnackBar(message: failure.error, color: Colors.red);
      },
          (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully registered");
      },
    );
  }

  Future<void> loginUser(
      String email,
      String password,
      ) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
          (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error, color: Colors.red);
      },
          (success) {
        state = state.copyWith(isLoading: false, error: null);
        openDashboardView();
      },
    );
  }

  void openDashboardView() {
    dnavigator.openDashboardView();
  }

  void openForgotPasswordView() {
    lnavigator.openForgotPasswordView();
  }
}
