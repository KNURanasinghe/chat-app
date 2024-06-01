import 'package:flutter/material.dart';

class CustomNavigation{
  static void nextPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}