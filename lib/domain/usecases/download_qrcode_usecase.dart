import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_web/app/error/failures.dart';
import 'package:find_scan_return_web/app/usecases/usecase.dart';
import 'package:find_scan_return_web/domain/repositories/qrcode_repository.dart';

class DownloadQrCodeUsecase implements UseCase<bool, ParamsDownload> {
  final QrCodeRepository repository;

  DownloadQrCodeUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamsDownload params) async {
    return await repository.downloadQr(batchNumber: params.batchNumber);
  }
}

class ParamsDownload extends Equatable {
  final int batchNumber;

  const ParamsDownload({required this.batchNumber});

  @override
  List<Object> get props => [batchNumber];
}