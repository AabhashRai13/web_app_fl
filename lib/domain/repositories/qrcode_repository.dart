import 'package:dartz/dartz.dart';
import 'package:find_scan_return_web/app/error/failures.dart';
import 'package:find_scan_return_web/domain/entities/batch_number.dart';

abstract class QrCodeRepository {
  Future<Either<Failure, bool>> generateQRCode({required int numberOfQrCode});

  Future<Either<Failure, List<BatchNumbers>>> getBatches();
  Future<void> downloadQr({required int batchNumber});
}
