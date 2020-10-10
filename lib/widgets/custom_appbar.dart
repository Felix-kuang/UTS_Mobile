import 'package:flutter/material.dart';
import 'package:uts/config/pallete.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Pallete.primaryColor,
      elevation: 1.0,
      title: 
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Aplikasi Covid-19",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ), 
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}