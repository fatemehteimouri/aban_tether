// To parse this JSON data, do
//
//     final updatePhoneNumberRequest = updatePhoneNumberRequestFromJson(jsonString);

class UpdatePhoneNumberRequest {
  String? phoneNumber;

  UpdatePhoneNumberRequest({
    this.phoneNumber,
  });
  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
  };
}
