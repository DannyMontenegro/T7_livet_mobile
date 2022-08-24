import 'package:flutter_test/flutter_test.dart';
import 'package:livet_mobile/models/indication.dart';
import 'package:livet_mobile/services/indations_service.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

void main() {
  late Endpoint endpoint;
  late IndicationsService service;
  setUpAll(() {
    service = IndicationsService();
    endpoint = Endpoint();
  });
  test(
    'Get indications should return an empty list if server is down',
    () async {
      endpoint.baseUrl = 'dummyurl.com';
      final indications = await service.getIndications();

      expect(indications.length, 0);
    },
  );
  test(
    'Get indications should always return a list of appointmets',
    () async {
      final indications = await service.getIndications();

      expect(indications.runtimeType, List<Indication>);
    },
  );
}
