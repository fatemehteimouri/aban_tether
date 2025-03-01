

class LoginResult {
  final String? authToken;

  LoginResult({
    this.authToken,
  });

  LoginResult copyWith({
    String? authToken,
  }) =>
      LoginResult(
        authToken: authToken ?? this.authToken,
      );

}
