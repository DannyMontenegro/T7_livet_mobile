import 'package:flutter/material.dart';
import 'package:livet_mobile/models/doctor.dart';

class Appoinment {
  final String name;
  final DateTime from;
  final DateTime to;
  late Color backgroundColor;
  final Doctor? doctor;
  Appoinment(this.name, this.from, this.to, [this.doctor]) {
    _getColor();
  }

  factory Appoinment.fromMap(Map<String, dynamic> jsonResponse) {
    final _name = jsonResponse['nombre'] as String;
    final _start = jsonResponse['inicio'] as DateTime;
    final _end = jsonResponse['fin'] as DateTime;
    final _doctor = Doctor(jsonResponse['doctor'], '');

    return Appoinment(_name, _start, _end, _doctor);
  }

  void _getColor() {
    final DateTime today = DateTime.now();
    if (today.isAfter(to)) {
      backgroundColor = Colors.blue;
    } else {
      backgroundColor = Colors.lightGreen;
    }
  }
}
