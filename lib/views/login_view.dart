import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/image_routes.dart';
import 'package:livet_mobile/constans/routes.dart';
import 'package:livet_mobile/services/login_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usuario = TextEditingController();
    final TextEditingController _contrasenia = TextEditingController();
    const LoginService _login = LoginService();

    const fieldPadding = EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0);
    const textFieldStyle = TextStyle(color: Colors.white);
    const inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );

    return LoaderOverlay(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75.0),
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.only(top: 75),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: fieldPadding,
                            child: TextField(
                              style: textFieldStyle,
                              controller: _usuario,
                              decoration: const InputDecoration(
                                labelText: 'Usuario',
                                focusColor: Colors.white,
                                focusedBorder: inputBorder,
                                border: inputBorder,
                              ),
                            ),
                          ),
                          Padding(
                            padding: fieldPadding,
                            child: TextField(
                              style: textFieldStyle,
                              controller: _contrasenia,
                              decoration: const InputDecoration(
                                labelText: 'Contraseña',
                                border: inputBorder,
                                focusedBorder: inputBorder,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade900,
                              fixedSize: const Size.fromWidth(120),
                            ),
                            onPressed: () async {
                              context.loaderOverlay.show();
                              //Navigator.of(context).popAndPushNamed(appRoute);
                              final shouldLogin =
                                  await _login.loginWithCredentials(
                                email: '',
                                password: '',
                                context: context,
                              );
                              if (shouldLogin) {
                                Navigator.of(context).popAndPushNamed(appRoute);
                              } else {}
                              context.loaderOverlay.hide();
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(logo, height: 150, width: 250, fit: BoxFit.fill),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
