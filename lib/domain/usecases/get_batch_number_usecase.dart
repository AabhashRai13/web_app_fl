import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_web/app/error/failures.dart';
import 'package:find_scan_return_web/app/usecases/usecase.dart';
import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/domain/repositories/qrcode_repository.dart';

class GetBatchNumberUseCase implements UseCase<List<BatchNumbers>, NoParams> {
  final QrCodeRepository repository;

  GetBatchNumberUseCase(this.repository);

  @override
  Future<Either<Failure, List<BatchNumbers>>> call(NoParams noparams) async {
    return await repository.getBatches();
  }
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}