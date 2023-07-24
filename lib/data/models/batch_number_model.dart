import 'dart:convert';

import 'package:find_scan_return_web/domain/entities/batch_number.dart';

List<BatchNumbersModel> batchNumbersModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<BatchNumbersModel>.from(
      jsonData.map((x) => BatchNumbersModel.fromJson(x)));
}

String batchNumbersModelToJson(List<BatchNumbersModel> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class BatchNumbersModel extends BatchNumbers {
  BatchNumbersModel({String? dateTime, int? batchNumber})
      : super(batchNumber: batchNumber, dateTime: dateTime);

  factory BatchNumbersModel.fromJson(Map<String, dynamic> json) =>
       BatchNumbersModel(
        dateTime: json["dateTime"],
        batchNumber: json["batchNumber"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime,
        "batchNumber": batchNumber,
      };
}