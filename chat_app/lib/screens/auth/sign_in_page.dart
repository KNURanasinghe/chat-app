import 'package:chat_app/utils/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../home/conversation/conversation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {
                CustomNavigation.nextPage(context, const ConversationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
