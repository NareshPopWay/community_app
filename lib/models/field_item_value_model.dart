// To parse this JSON data, do
//
//     final fieldItemValueModel = fieldItemValueModelFromJson(jsonString);

import 'dart:convert';

List<FieldItemValueModel> fieldItemValueModelFromJson(String str) => List<FieldItemValueModel>.from(json.decode(str).map((x) => FieldItemValueModel.fromJson(x)));

String fieldItemValueModelToJson(List<FieldItemValueModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FieldItemValueModel {
  int value;
  String text;

  FieldItemValueModel({
    required this.value,
    required this.text,
  });

  factory FieldItemValueModel.fromJson(Map<String, dynamic> json) => FieldItemValueModel(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}
