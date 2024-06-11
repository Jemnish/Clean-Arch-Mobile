class AuthState {
  final bool isLoading;

  final String? error;

  final bool obscurePassword;

  AuthState({
    required this.obscurePassword,
    required this.isLoading,
    this.error,
  });

  factory AuthState.initial() => AuthState(
        isLoading: false,
        error: null,
        obscurePassword: true,
      );

  AuthState copyWith({
    bool? isLoading,
    bool? obscurePassword,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
