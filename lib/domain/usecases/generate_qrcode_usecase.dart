import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_web/app/error/failures.dart';
import 'package:find_scan_return_web/app/usecases/usecase.dart';
import 'package:find_scan_return_web/domain/repositories/qrcode_repository.dart';

class GenerateQrCodeUsecase implements UseCase<bool, Params> {
  final QrCodeRepository repository;

  GenerateQrCodeUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.generateQRCode(numberOfQrCode: params.numberOfQrCode);
  }
}

class Params extends Equatable {
  final int numberOfQrCode;


  const Params({required this.numberOfQrCode});

  @override
  List<Object> get props => [numberOfQrCode];
}