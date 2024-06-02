import 'package:chat_app/controllers/auth_Controllers.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/home/conversation/conversation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../screens/auth/sign_in_page.dart';
import '../utils/navigation/custom_navigation.dart';

class AuthProviders extends ChangeNotifier {
  AuthController authController = AuthController();
  User? _user;
  User? get user => _user;
  Future<void> listnToAuthUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          Logger().e('User is currently signed out!');
          CustomNavigation.nextPage(context, const SignInPage());
        } else {
          Logger().f('User is signed in!');
          _user = user;
          notifyListeners();
          CustomNavigation.nextPage(context, const ConversationScreen());
        }
      },
    );
  }

  Future<void> signInWithGoogle() async {
    final credenial = await authController.signInWithGoogle();
    if (credenial != null) {
      UserModel user = UserModel(
        name: _user!.displayName!,
        lastSeen: DateTime.now().toString(),
        image: _user!.photoURL!,
        uid: _user!.uid ,
        isOnline: true,
      );
      await authController.saveUserData(user);
    }
  }

  Future<void> userSignOut() async {
    await authController.userSignOut();
  }
}
