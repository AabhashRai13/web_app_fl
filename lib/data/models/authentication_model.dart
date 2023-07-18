import 'package:find_scan_return_web/domain/entities/authentication.dart';

class AuthenticationModel extends Authentication {
  AuthenticationModel(
      {required String username,
      required String email,
      required String password,
      required bool isAdmin,
      required bool isPrinter,
      String? qrId,
      required String id,
      required String createdAt,
      required String updatedAt,
      required int v})
      : super(
            updatedAt: updatedAt,
            email: email,
            username: username,
            password: password,
            isAdmin: isAdmin,
            isPrinter: isPrinter,
            qrId: qrId,
            createdAt: createdAt,
            v: v,
            id: id);
  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        isPrinter: json["isPrinter"],
        qrId: json["qrId"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "isPrinter": isPrinter,
        "qrId": qrId,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
