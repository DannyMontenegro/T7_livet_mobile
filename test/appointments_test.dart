import 'package:flutter_test/flutter_test.dart';
import 'package:livet_mobile/models/appoinment.dart';
import 'package:livet_mobile/services/appointmets_service.dart';

void main() {
  late AppoinmentService appoinmentService;
  setUpAll(() {
    appoinmentService = AppoinmentService();
  });

  test(
    'Get appointment should always return a list of appointmets',
    () async {
      final appointments = await appoinmentService.getAppoinmentList();

      expect(appointments.runtimeType, List<Appoinment>);
    },
  );
}
