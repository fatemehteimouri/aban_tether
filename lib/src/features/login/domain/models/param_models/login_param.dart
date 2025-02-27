// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

class LoginParam {
  String? email;
  String? password;

  LoginParam({
    this.email,
    this.password,
  });
}
