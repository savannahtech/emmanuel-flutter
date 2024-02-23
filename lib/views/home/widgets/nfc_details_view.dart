import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:nfc_data_logger/models/nfc_data.dart';

class NfcDetailsView extends StatelessWidget {
  final NfcData data;
  const NfcDetailsView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: JsonView.map(
        data.data!.toJson(),
        theme:  const JsonViewTheme(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
