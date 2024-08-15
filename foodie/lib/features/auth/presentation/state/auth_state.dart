import '../../domain/entity/auth_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final AuthEntity? user; // Add this field if you want to store user data
  final String? authToken; // Add this field if you want to store an authentication token

  AuthState({
    required this.isLoading,
    this.error,
    this.imageName,
    this.user,       // Initialize the new fields
    this.authToken,  // Initialize the new fields
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      imageName: null,
      user: null,       // Initialize the new fields
      authToken: null,  // Initialize the new fields
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    AuthEntity? user,       // Include the new fields
    String? authToken,      // Include the new fields
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      user: user ?? this.user,           // Update the new fields
      authToken: authToken ?? this.authToken, // Update the new fields
    );
  }

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, error: $error, imageName: $imageName, user: $user, authToken: $authToken)';
  }
}
