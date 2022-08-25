import 'package:flutter/material.dart';
import 'package:livet_mobile/models/appoinment_data_source.dart';
import 'package:livet_mobile/services/appointmets_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppoinmentCalendar extends StatelessWidget {
  AppoinmentCalendar({Key? key}) : super(key: key);

  final AppoinmentService service = AppoinmentService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          const Center(
            child: Text(
              'Calendario de citas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(showAgenda: true),
              dataSource: AppoinmentDataSource(service.getAppointments()),
              showDatePickerButton: true,
              headerDateFormat: 'MMMM-y',
            ),
          ),
        ],
      ),
    );
  }
}
