import 'package:chat_app/components/customButton.dart';
import 'package:flutter/material.dart';

import '../../components/customTextField.dart';
import '../home/conversation/conversation.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.chat,
              size: 100,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "LOGIN",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(controller: emailController, name: "Email"),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: passwordController, name: "Password"),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonName: "Log In", page: const ConversationScreen()),
          ],
        ),
      ),
    );
  }
}
