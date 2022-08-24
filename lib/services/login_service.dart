import 'package:flutter/material.dart';
import 'package:livet_mobile/auth/keys.dart';
import 'package:livet_mobile/constans/endpoints.dart';
import 'package:livet_mobile/enum/login_status.dart';
import 'package:livet_mobile/utilities/current_user.dart';
import 'package:livet_mobile/utilities/dialogs.dart';
import 'package:livet_mobile/utilities/endpoint.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class LoginService {
  late CognitoUser cognitoUser;

  final userPool = CognitoUserPool(
    reactAppCognitoUserPollId,
    reactAppCognitoClientId,
  );

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

  Future<LoginStatus> cognitoLogin({
    required String username,
    required String password,
  }) async {
    cognitoUser = CognitoUser(username, userPool);
    final authDetails = AuthenticationDetails(
      username: username,
      password: password,
    );

    try {
      await cognitoUser.authenticateUser(authDetails);
      LoggedUser().userLogged = cognitoUser;
    } catch (err) {
      return LoginStatus.WRONGCREDENTIALS;
    }
    return LoginStatus.SUCCESSFULL;
  }
}
