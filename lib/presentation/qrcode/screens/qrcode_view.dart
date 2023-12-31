import 'package:find_scan_return_web/app/di.dart';
import 'package:find_scan_return_web/presentation/qrcode/screens/qrcode_desktop.dart';
import 'package:find_scan_return_web/presentation/qrcode/screens/qrcode_mobile.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/qr_bloc.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final QrBloc qrBloc = sl<QrBloc>();

  @override
  void initState() {
    super.initState();
    qrBloc.add(const GetBatchNumbersEvent());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<QrBloc, QrState>(
      bloc: qrBloc,
      listener: (context, state) {
        if (state is QrCreated) {
          qrBloc.add(const GetBatchNumbersEvent());
        }
      },
      builder: (context, state) {
        if (state is BatchNumber) {
          if (state.batchNumbers.isEmpty) {
            return const Center(
              child: Text(AppStrings.createQrByButton),
            );
          }
          return Responsive(
            mobile: QrCodeMobile(
              batchNumbers: state.batchNumbers,
            ),
            tablet: QrCodeDesktop(
              batchNumbers: state.batchNumbers,
            ),
            desktop: QrCodeDesktop(
              batchNumbers: state.batchNumbers,
            ),
          );
        } else if (state is BatchNumberLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QrLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QrError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text(AppStrings.createQr),
          );
        }
      },
    );
  }
}
