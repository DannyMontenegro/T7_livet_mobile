import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/endpoints.dart';
import 'package:livet_mobile/utilities/dialogs.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

class LoginService {
  LoginService();

  final Endpoint endpointService = Endpoint();

  Future<bool> loginWithCredentials(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final Map<String, String> credentials = {
        'email': email,
        'password': password,
      };
      final bool shouldLogin = await endpointService.postData(
        login,
        credentials,
      );
      if (!shouldLogin) {
        await showMessageDialog(
          title: 'Credenciales incorrectas',
          context: context,
          text: 'Las credenciales ingresadas son incorrectas',
        );
      }
      return shouldLogin;
    } catch (err) {
      await showMessageDialog(
        title: 'Error al iniciar sesión',
        context: context,
        text: 'Ocurrió un error al iniciar sesión',
      );
    }

    return true; //This should be false
  }
}
