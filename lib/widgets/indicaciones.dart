// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:livet_mobile/services/clinical_history_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Indicaciones extends StatelessWidget {
  Indicaciones({Key? key}) : super(key: key);

  final ClinicalHistoryService _service = ClinicalHistoryService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Solicitar historía clínica'),
          ElevatedButton(
            onPressed: () async {
              context.loaderOverlay.show();
              await _service.askForClinicalHistory(context);
              context.loaderOverlay.hide();
            },
            child: const Text('Enviar solicitud'),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
