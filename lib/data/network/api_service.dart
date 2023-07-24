import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:find_scan_return_web/app/app_constants.dart';
import 'package:find_scan_return_web/data/models/authentication_model.dart';
import 'package:find_scan_return_web/domain/entities/authentication.dart';
import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/domain/entities/register.dart';

import '../../domain/entities/sign_in.dart';
import '../models/batch_number_model.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Authentication?> signIn(SignIn signIn) async {
    try {
      final response = await dio.post('${AppConstants.devBaseURL}/auth/login',
          data: signIn.toJson());

      if (response.statusCode == 200) {
        Authentication authentication =
            AuthenticationModel.fromJson(response.data);

        return authentication;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }

  Future<Authentication?> registerUser(Register registerParam) async {
    try {
      final response = await dio.post(
        '${AppConstants.devBaseURL}/auth/register',
        data: registerParam.toJson(),
      );

      if (response.statusCode == 201) {
        Authentication authentication =
            AuthenticationModel.fromJson(response.data);

        return authentication;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }

  Future<bool> createQrCodes(int numberOfQrCodes, String accessToken) async {
    try {
      final response = await dio.post(
          '${AppConstants.devBaseURL}/qrcodes/generate/$numberOfQrCodes',
          options: Options(headers: {
            'token': 'Bearer $accessToken',
          }));

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error $e");
      return false;
    }
  }

  Future<List<BatchNumbers>?> getBatchNumbers(String accessToken) async {
    try {
      final response =
          await dio.get('${AppConstants.devBaseURL}/qrcodes/batchNumber',
              options: Options(headers: {
                'token': 'Bearer $accessToken',
              }));

      if (response.statusCode == 200) {
        List<BatchNumbers> batchNumbers = [];
        response.data.forEach((e) {
          batchNumbers.add(BatchNumbersModel.fromJson(e));
        });
        return batchNumbers;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}