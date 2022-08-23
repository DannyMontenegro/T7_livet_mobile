import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/image_routes.dart';
import 'package:livet_mobile/models/indication.dart';

class HeaderCita extends StatelessWidget {
  const HeaderCita({Key? key, required this.indication}) : super(key: key);
  final style = const TextStyle(color: Colors.black);
  final Indication indication;

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
            Text(
              indication.doctor.name,
              style: const TextStyle(color: Colors.white),
            ),
            Text(indication.doctor.speciality, style: style),
            const SizedBox(height: 5),
            //Text('Fecha: ' + indication.date.toString(), style: style),
            Text('Fecha: 2022-05-18', style: style)
          ],
        ),
      ],
    );
  }
}
