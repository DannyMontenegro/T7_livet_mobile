// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:livet_mobile/services/clinical_history_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Indicaciones extends StatelessWidget {
  Indicaciones({Key? key}) : super(key: key);
  final DateTime fechaPrueba = DateTime.now();
  final String estado = 'Pendiente';

  final ClinicalHistoryService _service = ClinicalHistoryService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Fecha de la última solicitud: $fechaPrueba'),
          Text('Estado de la solicitud actual: $estado '),
          const SizedBox(
            height: 100,
          ),
          const Text('Solicitar historía clínica'),
          ElevatedButton(
            onPressed: () async {
              context.loaderOverlay.show();
              await _service.askForClinicalHistory();
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
