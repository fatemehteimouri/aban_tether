// To parse this JSON data, do
//
//     final meEntity = meEntityFromJson(jsonString);

import 'dart:convert';

MeEntity meEntityFromJson(String str) => MeEntity.fromJson(json.decode(str));

String meEntityToJson(MeEntity data) => json.encode(data.toJson());

class MeEntity {
  int? id;
  String? name;
  String? email;

  MeEntity({
    this.id,
    this.name,
    this.email,
  });

  factory MeEntity.fromJson(Map<String, dynamic> json) => MeEntity(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
