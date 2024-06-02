import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String name;
  TextEditingController controller;

  CustomTextField({super.key, required this.controller, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: name,
              )),
        ),
      ),
      
    );
   
  }
  
}
