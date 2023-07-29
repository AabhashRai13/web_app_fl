import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:find_scan_return_web/app/preferences/local_storage_manager.dart';
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
  final LocalStorageService _localStorageService = LocalStorageService();
  QrCodeRepositoryImpl(this.networkInfo, this.sharedPreferencesManager);

  @override
  Future<Either<Failure, bool>> downloadQr({int? batchNumber}) async {
    bool connection = await networkInfo.isConnected();
    log("-------- auth Token ----------");
    String accessToken = _localStorageService.getTokenFromLocalStorage()!;

    log(accessToken);
    if (connection) {
      try {
        final result = await apiService.downloadQrCodes(
            batchNumber.toString(), accessToken);

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
  Future<Either<Failure, bool>> generateQRCode(
      {required int numberOfQrCode}) async {
    bool connection = await networkInfo.isConnected();
    log("-------- auth Token ----------");
    String accessToken = _localStorageService.getTokenFromLocalStorage()!;
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
  Future<Either<Failure, List<BatchNumbers>>> getBatches() async {
    bool connection = await networkInfo.isConnected();
    log("-------- auth Token ----------");
    String accessToken = _localStorageService.getTokenFromLocalStorage()!;
    log(accessToken);
    if (connection) {
      try {
        final result = await apiService.getBatchNumbers(accessToken);

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