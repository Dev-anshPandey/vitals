import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitals/firebase_options.dart';
import 'package:vitals/provider/user_provider.dart';
import 'package:vitals/screen/clinical_document.dart';
import 'package:vitals/screen/form.dart';
import 'package:vitals/screen/home_screen.dart';
import 'package:vitals/screen/login_page.dart';
import 'package:vitals/screen/tips.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Vitals',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        routes: {
          '/': (context) => HomeScreen(),
          '/homeScreen': ((context) => HomeScreen()),
          '/CD': (context) => CD(),
          '/form': (context) => Forms(),
          '/tips': (context) => Tips()
        },
        initialRoute: '/',
      ),
    );
  }
}
