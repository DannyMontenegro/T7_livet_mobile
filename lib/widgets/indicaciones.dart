import 'package:flutter/material.dart';
import 'package:livet_mobile/models/appoinment_data_source.dart';
import 'package:livet_mobile/services/appointmets_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Indicaciones extends StatelessWidget {
  final AppoinmentService service = AppoinmentService();
  Indicaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      monthViewSettings: const MonthViewSettings(showAgenda: true),
      dataSource: AppoinmentDataSource(service.getAppointments()),
    );
  }
}
