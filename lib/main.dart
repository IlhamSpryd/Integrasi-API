import 'package:flutter/material.dart';
import 'package:gallery_apps/view/dashboard_page.dart';
import 'package:gallery_apps/view/login_page.dart';
import 'package:gallery_apps/view/register_page.dart';

void main() {
  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Apps',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        PostApiScreen.id: (context) => const PostApiScreen(),
        DashboardPage.id: (context) => const DashboardPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.orangeAccent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orangeAccent,
        ),
      ),
    );
  }
}
