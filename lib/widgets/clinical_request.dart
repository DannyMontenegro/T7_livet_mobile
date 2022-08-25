import 'package:flutter/material.dart';

class ClinicalRequestData extends StatelessWidget {
  final DateTime? date;
  final String? currentState;
  const ClinicalRequestData(
      {Key? key, required this.date, required this.currentState})
      : super(key: key);

  final TextStyle style = const TextStyle();
  @override
  Widget build(BuildContext context) {
    return date == null && currentState == null
        ? const Text('No existen datos sobre solicitud actual')
        : Column(
            children: [
              Text('Fecha de la última solicitud: ' + date.toString()),
              Text('Estado de la última solicitud: $currentState')
            ],
          );
  }
}
