import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/image_routes.dart';

class HeaderCita extends StatelessWidget {
  const HeaderCita({Key? key}) : super(key: key);
  final style = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset(doctor),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dr. Cardiológo Luis',
              style: TextStyle(color: Colors.white),
            ),
            Text('Cardiología', style: style),
            const SizedBox(height: 5),
            Text('Fecha: 12/12/2020', style: style),
          ],
        ),
      ],
    );
  }
}
