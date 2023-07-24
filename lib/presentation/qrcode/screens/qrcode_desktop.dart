import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/presentation/widgets/widget/batch_table.dart';
import 'package:flutter/material.dart';

class QrCodeDesktop extends StatelessWidget {
  final List<BatchNumbers> batchNumbers;
  const QrCodeDesktop({super.key, required this.batchNumbers});

  @override
  Widget build(BuildContext context) {
    return BatchTable(
      data: batchNumbers,
    );
  }
}
