import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/presentation/widgets/widget/batch_table_mobile.dart';
import 'package:flutter/material.dart';

class QrCodeMobile extends StatelessWidget {
  final List<BatchNumbers> batchNumbers;
  const QrCodeMobile({super.key, required this.batchNumbers});

  @override
  Widget build(BuildContext context) {
    return BatchTableMobile(
      data: batchNumbers,
    );
  }
}
