import 'package:flutter/material.dart';
import 'package:livet_mobile/utilities/dialogs.dart';

class LoginService {
  const LoginService();

  Future<bool> loginWithCredentials(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print('Pre');
      await Future.delayed(const Duration(seconds: 5));
      print('Post');
    } catch (err) {
      showMessageDialog(
        title: 'Error al iniciar sesión',
        context: context,
        text: 'Ocurrió un error al iniciar sesión',
      );
    }

    return true;
  }
}
