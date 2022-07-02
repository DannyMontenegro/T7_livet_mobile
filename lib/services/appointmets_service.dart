import 'package:livet_mobile/models/appoinment.dart';

class AppoinmentService {
  AppoinmentService();

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
}
