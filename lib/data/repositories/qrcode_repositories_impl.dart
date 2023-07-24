import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:find_scan_return_web/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_web/data/network/api_service.dart';
import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/domain/repositories/qrcode_repository.dart';
import '../../app/error/exceptions.dart';
import '../../app/error/failures.dart';
import '../../app/network/network_info.dart';

class QrCodeRepositoryImpl implements QrCodeRepository {
  final NetworkInfo networkInfo;

  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService = ApiService();
  QrCodeRepositoryImpl(this.networkInfo, this.sharedPreferencesManager);

  @override
  Future<void> downloadQr({int? batchNumber}) {
    // TODO: implement downloadQr
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> generateQRCode(
      {required int numberOfQrCode}) async {
    bool connection = await networkInfo.isConnected();
    log("-------- auth Token ----------");
    String accessToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YmI2OTBiNmNlZDQ5NTZlY2UyNmVhMCIsImlzQWRtaW4iOnRydWUsImlzUHJpbnRlciI6dHJ1ZSwiaWF0IjoxNjkwMDkxMzg5LCJleHAiOjE2OTAzNTA1ODl9.z2EpUficZbkfdxORPPCsiyfi7Tudf_XnsfN-ao0zKQU";

    log(accessToken);
    if (connection) {
      try {
        final result =
            await apiService.createQrCodes(numberOfQrCode, accessToken);

        if (result) {
          return Right(result);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BatchNumbers>>> getBatches()async {
     bool connection = await networkInfo.isConnected();
    log("-------- auth Token ----------");
    String accessToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YmI2OTBiNmNlZDQ5NTZlY2UyNmVhMCIsImlzQWRtaW4iOnRydWUsImlzUHJpbnRlciI6dHJ1ZSwiaWF0IjoxNjkwMDkxMzg5LCJleHAiOjE2OTAzNTA1ODl9.z2EpUficZbkfdxORPPCsiyfi7Tudf_XnsfN-ao0zKQU";

    log(accessToken);
    if (connection) {
      try {
        final result =
            await apiService.getBatchNumbers(accessToken);

        if (result != null) {
          return Right(result);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}