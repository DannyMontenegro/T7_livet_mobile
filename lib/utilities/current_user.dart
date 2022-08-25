import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class LoggedUser {
  late CognitoUser userLogged;
  LoggedUser._sharedInstance();

  static final LoggedUser _instance = LoggedUser._sharedInstance();

  factory LoggedUser() => _instance;
}
