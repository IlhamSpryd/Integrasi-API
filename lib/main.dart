import 'package:flutter/material.dart';
import 'package:gallery_apps/view/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Flow App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(surface: Colors.white),
      ),
      home: const LoginPage(),
    );
  }
}
