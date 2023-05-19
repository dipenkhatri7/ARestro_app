import 'package:arestro_app/features/auth/screens/signIn.dart';
import 'package:arestro_app/features/get_started/getStarted.dart';
import 'package:arestro_app/features/pages/screens/passwordSuccess.dart';
import 'package:arestro_app/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARestro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: GetStarted(),
    );
  }
}
