import 'dart:async';

import 'package:chat_app/providers/auth_Providers.dart';
import 'package:chat_app/utils/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const SignInPage(),
    //       ));
    // });

    Timer(const Duration(seconds: 3), () {
      Provider.of<AuthProviders>(context, listen: false).listnToAuthUser(context);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_rounded,
              size: 100,
              color: Colors.amber.shade800,
            ), 
            Text(
              "Chat App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.amber.shade800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
