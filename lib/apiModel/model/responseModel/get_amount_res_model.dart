// To parse this JSON data, do
//
//     final getAmontResModel = getAmontResModelFromJson(jsonString);

import 'dart:convert';

GetAmontResModel getAmontResModelFromJson(String str) => GetAmontResModel.fromJson(json.decode(str));

String getAmontResModelToJson(GetAmontResModel data) => json.encode(data.toJson());

class GetAmontResModel {
  GetAmontResModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory GetAmontResModel.fromJson(Map<String, dynamic> json) => GetAmontResModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.balance,
  });

  String? id;
  String? balance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "balance": balance,
  };
}
