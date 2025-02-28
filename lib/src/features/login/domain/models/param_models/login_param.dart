class LoginParam {
  final String? email;
  final String? password;

  LoginParam({
    this.email,
    this.password,
  });

  LoginParam copyWith({
    String? email,
    String? password,
  }) {
    return LoginParam(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
