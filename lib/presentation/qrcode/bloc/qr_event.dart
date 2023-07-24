part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class CreateQrEvent extends QrEvent {
  final int numberOfQrcodes;
  const CreateQrEvent({required this.numberOfQrcodes});
}

class GetBatchNumbersEvent extends QrEvent {
  const GetBatchNumbersEvent();
}
