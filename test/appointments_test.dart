import 'package:flutter_test/flutter_test.dart';
import 'package:livet_mobile/models/appoinment.dart';
import 'package:livet_mobile/services/appointmets_service.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

void main() {
  late Endpoint endpoint;
  late AppoinmentService appoinmentService;
  setUpAll(() {
    endpoint = Endpoint();
    appoinmentService = AppoinmentService();
  });

  test(
    'Get appointment should always return a list of appointmets',
    () async {
      final appointments = await appoinmentService.getAppoinmentList();

      expect(appointments.runtimeType, List<Appoinment>);
    },
  );

  test(
    'Get appointments should return an empty list if server is down',
    () async {
      endpoint.baseUrl = 'dummyurl.com';
      final appointments = await appoinmentService.getAppoinmentList();

      expect(appointments.length, 0);
    },
  );
}
