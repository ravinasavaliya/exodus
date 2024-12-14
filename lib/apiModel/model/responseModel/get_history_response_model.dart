// To parse this JSON data, do
//
//     final getHistoryResponseModel = getHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

GetHistoryResponseModel getHistoryResponseModelFromJson(String str) =>
    GetHistoryResponseModel.fromJson(json.decode(str));

String getHistoryResponseModelToJson(GetHistoryResponseModel data) =>
    json.encode(data.toJson());

class GetHistoryResponseModel {
  GetHistoryResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory GetHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      GetHistoryResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.amount,
    this.sendingAddress,
    this.receiveAddress,
    this.transactionId,
    this.description,
    this.entryDateTime,
  });

  String? id;
  String? amount;
  String? sendingAddress;
  String? receiveAddress;
  String? transactionId;
  String? description;
  DateTime? entryDateTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        amount: json["amount"],
        sendingAddress: json["sending_address"],
        receiveAddress: json["receive_address"],
        transactionId: json["transaction_id"],
        description: json["description"],
        entryDateTime: DateTime.parse(json["entry_date_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "sending_address": sendingAddress,
        "receive_address": receiveAddress,
        "transaction_id": transactionId,
        "description": description,
        "entry_date_time": entryDateTime,
      };
}
