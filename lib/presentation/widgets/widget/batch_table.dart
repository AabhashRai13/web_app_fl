import 'package:find_scan_return_web/app/di.dart';
import 'package:find_scan_return_web/domain/entities/batch_number.dart';
import 'package:find_scan_return_web/presentation/qrcode/bloc/qr_bloc.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/resources/style_constants.dart';
import 'package:find_scan_return_web/presentation/widgets/buttons/hover_button.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class BatchTable extends StatelessWidget {
  final List<BatchNumbers> data; // Replace with your data model

  const BatchTable({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: [
          DataColumn(
              label: Text(
            AppStrings.batchNumber,
            style: topicStyleMobile,
          )),
          DataColumn(
              label: Text(
            AppStrings.dateGenerated,
            style: topicStyleMobile,
          )),
          // Add more DataColumn widgets as needed
        ],
        rows: data.mapIndexed((index, item) {
          return DataRow(
            cells: [
              DataCell(InkWell(
                onTap: () {},
                child: Text("Batch numbers: ${item.batchNumber}"),
              )),
              DataCell(DataCellWithIcon(
                date: item.dateTime,
                index: index,
                batchNumber: item.batchNumber!,
              )),
              // Add more DataCell widgets as needed
            ],
          );
        }).toList(),
      ),
    );
  }
}

class DataCellWithIcon extends StatelessWidget {
  final String? date;

  final int? index;
  final int batchNumber;
  DataCellWithIcon(
      {super.key, this.date, this.index, required this.batchNumber});
  final QrBloc qrBloc = sl<QrBloc>();

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete this Batch?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(date!),
        const Spacer(),
        HoverButton(
          hoverText: AppStrings.downloadQrCodes,
          color: Colors.red,
          icon: Icons.download,
          function: () {
            qrBloc.add(DownloadQrEvent(batchNumber: batchNumber));
          },
        ),
        SizedBox(
          width: getProportionateScreenWidth(2),
        ),
        HoverButton(
          hoverText: AppStrings.delete,
          color: Colors.green,
          icon: Icons.delete,
          function: () {
            showMyDialog(context);
          },
        ),
        SizedBox(
          width: getProportionateScreenWidth(2),
        ),
      ],
    );
  }
}
