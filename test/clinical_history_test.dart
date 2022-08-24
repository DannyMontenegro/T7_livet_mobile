// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:livet_mobile/models/clinical_history_request.dart';
import 'package:livet_mobile/services/clinical_history_service.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

void main() {
  late Endpoint endpoint;
  late ClinicalHistoryService service;
  setUpAll(() {
    endpoint = Endpoint();
    service = ClinicalHistoryService();
  });

  test(
    'Clinical history request should always return a boolean',
    () async {
      final request = await service.askForClinicalHistory();

      expect(request, isA<bool>());
    },
  );

  test(
    'Clinical history request should always return false if server is down',
    () async {
      endpoint.baseUrl = 'dummyurl.com';
      final request = await service.askForClinicalHistory();

      expect(request, false);
    },
  );

  test(
    'Clinical history check request should always return a ClinicalHistoryRequest instance',
    () async {
      final request = await service.checkRequest();

      expect(request, isA<ClinicalHistoryRequest>());
    },
  );

  test(
    'Clinical history check request should always return a ClinicalHistoryRequest instance with null data if server is down',
    () async {
      endpoint.baseUrl = 'dummyurl.com';
      final request = await service.checkRequest();

      expect(request.date, isA<void>());
      expect(request.status, isA<void>());
    },
  );
}
