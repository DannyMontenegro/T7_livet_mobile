import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/routes.dart';
import 'package:livet_mobile/constans/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('es'),
      ],
      locale: const Locale('es'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => const LoginView(),
        appRoute: (context) => const AppView(),
      },
    );
  }
}
