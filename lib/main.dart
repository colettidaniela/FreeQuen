import 'package:flutter/material.dart';
import 'package:promosnqn/crud/crud.dart';
import 'package:promosnqn/firebase_login/pantalla_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:promosnqn/home/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PromoQuen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginScreen(),
    );
  }
}
