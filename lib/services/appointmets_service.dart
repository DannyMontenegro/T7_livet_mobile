import 'package:flutter/cupertino.dart';
import 'package:livet_mobile/constans/endpoints.dart' as endpoints;
import 'package:livet_mobile/models/appoinment.dart';
import 'package:livet_mobile/utilities/dialogs.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

class AppoinmentService {
  AppoinmentService();

  final Endpoint endpointService = Endpoint();

  //This method should get data from the rest api
  List<Appoinment> getAppointments() {
    return [
      Appoinment(
        'Cita 1',
        DateTime(2022, 6, 1, 10, 0, 0),
        DateTime(2022, 6, 1, 12, 0, 0),
      ),
      Appoinment(
        'Cita 2',
        DateTime(2022, 6, 17, 18, 0, 0),
        DateTime(2022, 6, 17, 20, 0, 0),
      ),
      Appoinment(
        'Cita 3',
        DateTime(2022, 6, 18, 15, 0, 0),
        DateTime(2022, 6, 18, 15, 30, 0),
      ),
      Appoinment(
        'Cita 4',
        DateTime(2022, 7, 20, 15, 0, 0),
        DateTime(2022, 6, 20, 15, 30, 0),
      ),
    ];
  }

  Future<List<Appoinment>> getAppoinmentList(BuildContext context) async {
    List<Appoinment> data = [];
    try {
      final List<dynamic> list =
          await endpointService.getData(endpoints.getAppointments);
      list.map((appointment) => data.add(Appoinment.fromMap(appointment)));
    } catch (e) {
      await showMessageDialog(
        title: 'Error al iniciar sesión',
        context: context,
        text: 'Ocurrió un error al iniciar sesión',
      );
    }
    return data;
  }
}
