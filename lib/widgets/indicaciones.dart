// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:livet_mobile/models/clinical_history_request.dart';
import 'package:livet_mobile/services/clinical_history_service.dart';
import 'package:livet_mobile/utilities/dialogs.dart';
import 'package:livet_mobile/widgets/clinical_request.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Indicaciones extends StatefulWidget {
  const Indicaciones({Key? key}) : super(key: key);

  @override
  State<Indicaciones> createState() => _IndicacionesState();
}

class _IndicacionesState extends State<Indicaciones>
    with AutomaticKeepAliveClientMixin<Indicaciones> {
  @override
  bool get wantKeepAlive => true;
  final DateTime fechaPrueba = DateTime.now();

  final String estado = 'Pendiente';

  final ClinicalHistoryService _service = ClinicalHistoryService();
  late Future<ClinicalHistoryRequest> request;

  @override
  void initState() {
    super.initState();
    request = _service.checkRequest();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Información de solicitud actual',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        _getPreviousRequest(context),
        const SizedBox(
          height: 100,
        ),
        const Text('Solicitar historía clínica'),
        ElevatedButton(
          onPressed: () async {
            context.loaderOverlay.show();
            final sendRequest = await _service.askForClinicalHistory();
            context.loaderOverlay.hide();
            if (sendRequest) {
              await showMessageDialog(
                context: context,
                title: 'Solicitud enviada',
                text:
                    'Su solicitud de historia clínica fue recibida exitosamente',
              );
            } else {
              await showMessageDialog(
                context: context,
                title: 'Solicitud rechazada',
                text:
                    'Su solicitud de historia clínica fue rechazada debido a que ya existe una solicitud pendiente',
              );
            }

            setState(() {
              request = _service.checkRequest();
            });
          },
          child: const Text('Enviar solicitud'),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget _getPreviousRequest(BuildContext context) {
    return FutureBuilder<ClinicalHistoryRequest>(
      future: request,
      builder: (BuildContext context,
          AsyncSnapshot<ClinicalHistoryRequest> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          ClinicalHistoryRequest? data = snapshot.data;
          if (data == null) {
            return const Text(
              'Ocurrió un error al obtener información sobre su solicitud',
            );
          }

          return ClinicalRequestData(
            date: data.date,
            currentState: data.status,
          );
        }
      },
    );
  }
}
