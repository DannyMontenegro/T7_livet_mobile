import 'package:flutter/material.dart';

class BodyCita extends StatelessWidget {
  const BodyCita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Tomar medicación cada 8 horas"),
              SizedBox(height: 5),
              Text("No comer sal"),
              SizedBox(height: 5),
              Text("Salir a caminar 30 minutos al día"),
            ],
          ),
        ],
      ),
    );
  }
}
