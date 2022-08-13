// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/endpoints.dart';
import 'package:livet_mobile/utilities/dialogs.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

class ClinicalHistoryService {
  ClinicalHistoryService._sharedInstance();

  final Endpoint endpointService = Endpoint();

  static final ClinicalHistoryService _instance =
      ClinicalHistoryService._sharedInstance();

  factory ClinicalHistoryService() => _instance;

  Future<dynamic> askForClinicalHistory(BuildContext context) async {
    try {
      final bool requestSent =
          await endpointService.postData(askClinicalHistory, {});
      if (!requestSent) {
        await showMessageDialog(
            title: 'Ocurrió un error',
            text: 'No se pudo enviar la solicitud',
            context: context);
      }
      return requestSent;
    } catch (err) {
      await showMessageDialog(
          title: 'Ocurrió un error',
          text: 'No se contactar el servidor',
          context: context);
    }
    return true; //This should be false
  }
}
