import 'package:chat_app/components/customButton.dart';
import 'package:chat_app/screens/auth/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/providers/auth_Providers.dart';
import '../../components/customTextField.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "SignUp",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(controller: nameController, name: "Name"),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: emailController, name: "Email"),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: passwordController, name: "Password"),
            const SizedBox(
              height: 30,
            ),
            CustomButton(buttonName: "Sign Up", page: const LogInScreen()),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {
                Provider.of<AuthProviders>(context, listen: false).signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
