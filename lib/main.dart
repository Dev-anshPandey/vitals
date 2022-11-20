import 'package:flutter/material.dart';
import 'package:vitals/screen/clinical_document.dart';
import 'package:vitals/screen/home_screen.dart';
import 'package:vitals/screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitals',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      routes: {
        '/' :(context) => HomeScreen(),
        '/loginScreen' :((context) => LoginPage()) ,
        '/CD' :(context) => CD()
      },
      initialRoute: '/',
    );
  }
}
