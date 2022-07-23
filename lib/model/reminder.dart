// To parse this JSON data, do
//
//     final reminderModel = reminderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReminderModel reminderModelFromJson(String str) =>
    ReminderModel.fromJson(json.decode(str));

String reminderModelToJson(ReminderModel data) => json.encode(data.toJson());

class ReminderModel {
  ReminderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.alertText,
    required this.reminderDate,
    required this.reminderTime,
  });

  int id;
  String alertText;
  DateTime reminderDate;
  String reminderTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        alertText: json["alert_text"],
        reminderDate: DateTime.parse(json["reminder_date"]),
        reminderTime: json["reminder_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alert_text": alertText,
        "reminder_date":
            "${reminderDate.year.toString().padLeft(4, '0')}-${reminderDate.month.toString().padLeft(2, '0')}-${reminderDate.day.toString().padLeft(2, '0')}",
        "reminder_time": reminderTime,
      };
}
