// To parse this JSON data, do
//
//     final updatePhoneNumberResponse = updatePhoneNumberResponseFromJson(jsonString);



class UpdatePhoneNumberResponse {
  int? id;
  String? createdAt;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  UpdatePhoneNumberResponse({
    this.id,
    this.createdAt,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
  });

  factory UpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) => UpdatePhoneNumberResponse(
    id: json["id"],
    createdAt: json["created_at"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone_number"],
  );
}
