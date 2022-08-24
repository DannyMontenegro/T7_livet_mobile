// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:livet_mobile/constans/endpoints.dart';
import 'package:livet_mobile/models/clinical_history_request.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

class ClinicalHistoryService {
  ClinicalHistoryService._sharedInstance();

  final Endpoint endpointService = Endpoint();

  static final ClinicalHistoryService _instance =
      ClinicalHistoryService._sharedInstance();

  factory ClinicalHistoryService() => _instance;

  Future<bool> askForClinicalHistory() async {
    try {
      final bool requestSent =
          await endpointService.postData(askClinicalHistory, {});

      return requestSent;
    } catch (err) {
      log(err.toString());
      return false;
    }
  }

  Future<ClinicalHistoryRequest> checkRequest() async {
    try {
      final Map<String, String> data =
          await endpointService.getData(askClinicalHistory);
      final String? date = data['fecha'];

      if (date == null) {
        return ClinicalHistoryRequest();
      }

      return ClinicalHistoryRequest(
          date: DateTime.parse(date), status: data['estado']);
    } catch (error) {
      log(error.toString());
      return ClinicalHistoryRequest();
    }
  }
}
