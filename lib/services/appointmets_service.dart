import 'dart:developer';

import 'package:livet_mobile/constans/endpoints.dart' as endpoints;
import 'package:livet_mobile/models/appoinment.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

class AppoinmentService {
  AppoinmentService();

  final Endpoint endpointService = Endpoint();

  //This method should get data from the rest api
  List<Appoinment> getAppointments() {
    return [
      Appoinment(
        'Cita Dr. Avendaño',
        DateTime(2022, 8, 1, 10, 0, 0),
        DateTime(2022, 8, 1, 12, 0, 0),
      ),
      Appoinment(
        'Cita Dra. García',
        DateTime(2022, 8, 17, 10, 0, 0),
        DateTime(2022, 8, 17, 20, 0, 0),
      ),
      Appoinment(
        'Cita Dr. Avendaño',
        DateTime(2022, 8, 27, 15, 0, 0),
        DateTime(2022, 8, 27, 15, 30, 0),
      ),
      Appoinment(
        'Cita Dra. García',
        DateTime(2022, 8, 28, 15, 0, 0),
        DateTime(2022, 8, 28, 15, 30, 0),
      ),
    ];
  }

  Future<List<Appoinment>> getAppoinmentList() async {
    List<Appoinment> data = [];
    try {
      final List<dynamic> list =
          await endpointService.getData(endpoints.getAppointments);
      list.map((appointment) => data.add(Appoinment.fromMap(appointment)));
    } catch (e) {
      log(e.toString());
    }
    return data;
  }
}
