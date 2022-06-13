import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/routes.dart';
import 'package:livet_mobile/constans/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: appRoute,
      routes: {
        loginRoute: (context) => const LoginView(),
        appRoute: (context) => const AppView(),
      },
    );
  }
}
