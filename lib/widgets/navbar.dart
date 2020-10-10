import 'package:flutter/material.dart';
import 'package:uts/screens/about_screen.dart';
import 'package:uts/screens/screens.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List _screens = [
    HomeScreen(),
    StatistikScreen(),
    AboutScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.info]
        .asMap()
        .map(
          (key, value) => MapEntry(
            key, 
            BottomNavigationBarItem(
              title: Text(""),
              icon: Container(padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: _currentIndex == key 
                  ? Colors.blue[600] 
                  : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(value),
              ),
            ),
          )
        ).values.toList()
      ),
    );
  }
}
