part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();

  @override
  List<Object> get props => [];
}

class QrInitial extends QrState {}

class QrLoading extends QrState {}

class QrError extends QrState {
  final String message;
  const QrError({required this.message});
}

class QrCreated extends QrState {
  final bool created;
  const QrCreated({required this.created});
}

class BatchNumber extends QrState {
  final List<BatchNumbers> batchNumbers;
  const BatchNumber({required this.batchNumbers});
}

class BatchNumberLoading extends QrState {}

class QrDownloading extends QrState {}

class QrDownloaded extends QrState {}
