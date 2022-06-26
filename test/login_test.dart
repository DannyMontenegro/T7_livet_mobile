// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  final service = MockLoginService();

  test(
    'Login should return true on correct credentials',
    () async {
      final shouldLogin = await service.loginWithCredentials(
          email: 'MockUser', password: 'MockPassword');

      expect(shouldLogin, true);
    },
  );

  test('User token should be stored after successful login', () async {
    final shouldLogin = await service.loginWithCredentials(
        email: 'MockUser', password: 'MockPassword');

    expect(shouldLogin, true);
    final prefs = await SharedPreferences.getInstance();

    expect(prefs.getString('token'), const TypeMatcher<String>());
  });

  test(
    'Login should return false on incorrect credentials',
    () async {
      final shouldLogin = await service.loginWithCredentials(
          email: 'MockUser', password: 'badPassword');

      expect(shouldLogin, false);
    },
  );

  test('User token should not be stored after failed login', () async {
    final shouldLogin = await service.loginWithCredentials(
        email: 'MockUser', password: 'badPassword');

    expect(shouldLogin, false);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('token'), const TypeMatcher<void>());
  });
}

class MockLoginService {
  final String user = 'MockUser';
  final String password = 'MockPassword';

  Future<bool> loginWithCredentials(
      {required String email, required String password}) async {
    Future.delayed(const Duration(seconds: 2));

    if (email == user && password == this.password) {
      SharedPreferences.setMockInitialValues({'token': '123test'});
      return true;
    }
    return false;
  }
}
