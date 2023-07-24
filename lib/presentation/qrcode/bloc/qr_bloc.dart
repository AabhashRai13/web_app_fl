import 'package:equatable/equatable.dart';
import 'package:find_scan_return_web/app/error/failures.dart';
import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/domain/usecases/generate_qrcode_usecase.dart';
import 'package:find_scan_return_web/domain/usecases/get_batch_number_usecase.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final GenerateQrCodeUsecase generateQrCodeUsecase;
  final GetBatchNumberUseCase getBatchNumberUseCase;
  QrBloc(this.generateQrCodeUsecase, this.getBatchNumberUseCase)
      : super(QrInitial()) {
    on<CreateQrEvent>(createQr);
    on<GetBatchNumbersEvent>(getBatchNumber);
  }

  createQr(CreateQrEvent event, Emitter<QrState> emit) async {
    emit(QrLoading());
    final result = await generateQrCodeUsecase
        .call(Params(numberOfQrCode: event.numberOfQrcodes));

    result.fold((l) {
      if (l is ServerFailure) {
        emit(const QrError(message: AppStrings.serverFailure));
      } else {
        emit(const QrError(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(QrCreated(created: r));
    });
  }

  getBatchNumber(GetBatchNumbersEvent event, Emitter<QrState> emit) async {
    emit(BatchNumberLoading());
    final result = await getBatchNumberUseCase.call(const NoParams());

    result.fold((l) {
      if (l is ServerFailure) {
        emit(const QrError(message: AppStrings.serverFailure));
      } else {
        emit(const QrError(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(BatchNumber(batchNumbers: r));
    });
  }
}
