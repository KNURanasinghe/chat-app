import 'package:chat_app/utils/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  Widget page;
  CustomButton({super.key, required this.buttonName, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          CustomNavigation.nextPage(context, page);
        },
        child: Container(
          height: 60,
          width: 600,
          decoration: BoxDecoration(
              color: Colors.amber.shade600,
              borderRadius: BorderRadius.circular(10)),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                buttonName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
