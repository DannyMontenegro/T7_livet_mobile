import 'package:flutter/material.dart';

class Appoinment {
  final String name;
  final DateTime from;
  final DateTime to;
  late Color backgroundColor;
  Appoinment(
    this.name,
    this.from,
    this.to,
  ) {
    _getColor();
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
