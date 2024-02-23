import 'package:flutter/material.dart';
import 'package:nfc_data_logger/models/nfc_data.dart';
import 'package:nfc_data_logger/services/bottom_sheet.service.dart';
import 'package:nfc_data_logger/utils/utils.dart';
import 'package:nfc_data_logger/views/home/widgets/nfc_details_view.dart';

class NfcTile extends StatelessWidget {
  final NfcData data;
  final int index;
  const NfcTile({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        BottomSheetService.show(
          context: context,
          body: NfcDetailsView(data: data),
        );
      },
      leading: CircleAvatar(
        child: Text(
          (index + 1).toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        Utils.formatDateTime(
          data.createdAt!.toDate(),
        ),
      ),
    );
  }
}
