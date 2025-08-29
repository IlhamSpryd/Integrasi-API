import 'package:flutter/material.dart';
import 'package:gallery_apps/view/dashboard_page.dart';
import 'package:gallery_apps/view/search_page.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key, required int currentIndex, required void Function(int index) onTap});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [DashboardPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 25,
              height: 24,
              child: Image.asset("assets/images/home.png"),
            ),
            activeIcon: SizedBox(
              width: 25,
              height: 24,
              child: Image.asset("assets/images/home (1).png"),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 24,
              child: Image.asset("assets/images/search.png"),
            ),
            activeIcon: SizedBox(
              width: 30,
              height: 24,
              child: Image.asset("assets/images/search (1).png"),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
