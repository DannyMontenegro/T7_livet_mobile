// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: lines_longer_than_80_chars

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livet_mobile/auth/keys.dart';
import 'package:livet_mobile/enum/login_status.dart';
import 'package:livet_mobile/services/login_service.dart';
import 'package:livet_mobile/utilities/current_user.dart';

void main() {
  late LoginService login;
  late LoggedUser user;
  setUpAll(() {
    login = LoginService();
    user = LoggedUser();
  });

  test(
    'Login should return SUCCESSFUL on correct credentials',
    () async {
      final shouldLogin = await login.cognitoLogin(
          username: testUsername, password: testPassword);

      expect(shouldLogin, LoginStatus.SUCCESSFULL);
    },
  );

  test(
    'Login should return WRONGCREDENTIALS on incorrect credentials',
    () async {
      final shouldLogin = await login.cognitoLogin(
          username: 'MockUser', password: 'badPassword');

      expect(shouldLogin, LoginStatus.WRONGCREDENTIALS);
    },
  );

  test(
    'User should not be null on SUCCESSFUL login',
    () async {
      final shouldLogin = await login.cognitoLogin(
          username: testUsername, password: testPassword);

      expect(shouldLogin, LoginStatus.SUCCESSFULL);

      final userExists = user.userLogged;

      expect(userExists, isA<CognitoUser>());
    },
  );

  test(
    'User should be null on WRONGCREDENTIALS login',
    () async {
      await login.cognitoLogin(username: 'MockUser', password: 'badPassword');

      final userExists = user.userLogged;

      expect(userExists, isA<void>());
    },
  );
}
