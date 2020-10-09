import 'package:flutter/material.dart';
import 'package:uts/screens/screens.dart';
import 'package:uts/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Info Covid-19',
      debugShowCheckedModeBanner: false,
      routes: {
        CallScreen.id: (context) => CallScreen(),
        MessageScreen.id: (context) => MessageScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navbar(),
    );
  }
}
