import '../../domain/entity/auth_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final AuthEntity? user;
  final String? authToken;
  final bool? isFingerprintEnabled;
  final bool? isFingerprintAuthenticated;

  AuthState({
    required this.isLoading,
    this.error,
    this.imageName,
    this.user,
    this.authToken,
    this.isFingerprintEnabled,
    this.isFingerprintAuthenticated,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      imageName: null,
      user: null,
      authToken: null,
      isFingerprintEnabled: false,
      isFingerprintAuthenticated: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    AuthEntity? user,
    String? authToken,
    bool? isFingerprintEnabled,
    bool? isFingerprintAuthenticated,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      user: user ?? this.user,
      authToken: authToken ?? this.authToken,
      isFingerprintEnabled: isFingerprintEnabled ?? this.isFingerprintEnabled,
      isFingerprintAuthenticated: isFingerprintAuthenticated ?? this.isFingerprintAuthenticated,
    );
  }

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, error: $error, imageName: $imageName, user: $user, authToken: $authToken, isFingerprintEnabled: $isFingerprintEnabled, isFingerprintAuthenticated: $isFingerprintAuthenticated)';
  }
}
