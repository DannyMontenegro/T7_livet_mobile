class LoginService {
  const LoginService();

  Future<bool> loginWithCredentials(
      {required String email, required String password}) async {
    Future.delayed(const Duration(seconds: 3));

    return true;
  }
}
