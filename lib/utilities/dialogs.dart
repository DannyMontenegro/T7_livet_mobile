import 'package:flutter/material.dart';

Future<void> showMessageDialog({
  required BuildContext context,
  required String text,
  required String title,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Está seguro que quiere cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Cerrar sesión'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
