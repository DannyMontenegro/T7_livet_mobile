// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class Indicaciones extends StatelessWidget {
  const Indicaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Solicitar historía clínica'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Enviar solicitud'),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
