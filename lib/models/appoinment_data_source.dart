import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:livet_mobile/models/appoinment.dart';

class AppoinmentDataSource extends CalendarDataSource {
  AppoinmentDataSource(List<Appoinment> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return (appointments as List<Appoinment>)[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return (appointments as List<Appoinment>)[index].to;
  }

  @override
  String getSubject(int index) {
    return (appointments as List<Appoinment>)[index].name;
  }

  @override
  Color getColor(int index) {
    return (appointments as List<Appoinment>)[index].backgroundColor;
  }
}
