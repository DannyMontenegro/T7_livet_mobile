import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/image_routes.dart';
import 'package:livet_mobile/constans/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usuario = TextEditingController();
    final TextEditingController _contrasenia = TextEditingController();

    const fieldPadding = EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0);
    const textFieldStyle = TextStyle(color: Colors.white);
    const inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );

    return Scaffold(
      /*
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Image.asset(logo),
                ),
                Padding(
                  padding: fieldPadding,
                  child: TextField(
                    controller: _usuario,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: fieldPadding,
                  child: TextField(
                    controller: _contrasenia,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900,
                    fixedSize: const Size.fromWidth(120),
                  ),
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
      */
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
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed(appRoute);
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
    );
  }
}
