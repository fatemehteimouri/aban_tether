// To parse this JSON data, do
//
//     final updatePhoneNumberParam = updatePhoneNumberParamFromJson(jsonString);

import 'dart:convert';

UpdatePhoneNumberParam updatePhoneNumberParamFromJson(String str) => UpdatePhoneNumberParam.fromJson(json.decode(str));

String updatePhoneNumberParamToJson(UpdatePhoneNumberParam data) => json.encode(data.toJson());

class UpdatePhoneNumberParam {
  String? phoneNumber;

  UpdatePhoneNumberParam({
    this.phoneNumber,
  });

  UpdatePhoneNumberParam copyWith({
    String? phoneNumber,
  }) {
    return UpdatePhoneNumberParam(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory UpdatePhoneNumberParam.fromJson(Map<String, dynamic> json) => UpdatePhoneNumberParam(
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
  };
}
