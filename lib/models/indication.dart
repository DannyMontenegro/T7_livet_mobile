import 'package:intl/intl.dart';
import 'package:livet_mobile/models/doctor.dart';

class Indication {
  final List<String> _indications;
  Doctor doctor;
  DateTime date;

  Indication(
    this._indications,
    this.doctor,
    this.date,
  );

  factory Indication.fromMap(Map<String, dynamic> jsonResponse) {
    print('INDICACION');
    final Doctor _doctor = Doctor.fromMap(jsonResponse);
    final List<String> _recomendations =
        (jsonResponse['recomendacion'] as String).split(',');
    final String fecha = jsonResponse['fecha'] as String;

    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    print(dateFormat.parse('10-08-2022'));
    return Indication(_recomendations, _doctor, dateFormat.parse(fecha));
  }

  //Returns a copy of the list to avoid data inconsistence
  List<String> get indications {
    return [..._indications];
  }
}
