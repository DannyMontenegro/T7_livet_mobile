import 'package:flutter/material.dart';
import 'package:livet_mobile/models/appoinment_data_source.dart';
import 'package:livet_mobile/services/appointmets_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppoinmentCalendar extends StatelessWidget {
  AppoinmentCalendar({Key? key}) : super(key: key);

  final AppoinmentService service = AppoinmentService();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 5),
        const Center(
          child: Text('Calendario de citas'),
        ),
        Expanded(
          child: SfCalendar(
            view: CalendarView.month,
            monthViewSettings: const MonthViewSettings(showAgenda: true),
            dataSource: AppoinmentDataSource(service.getAppointments()),
          ),
        ),
      ],
    );
  }
}
