import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/providers/user_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../screens/auth/sign_in_page.dart';
import '../screens/home/conversations/conversation.dart';
import '../utils/navigation/custom_navigation.dart';

class AuthUProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  User? _user;
  User? get user => _user;

  Future<void> listenToAuthState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().e('User is currently signed out!');
        CustomNavigation.nextPage(context, const SignInPage());
      } else {
        Logger().f('User is signed in!');
        _user = user;
        Provider.of<UserProvider>(context, listen: false)
            .updateOnlineStatus(true, context);
        notifyListeners();
        CustomNavigation.nextPage(context, const ConversationScreen());
      }
    });
  }

  Future<void> signInWithGoogle() async {
    final credential = await authController.signInWithGoogle();

    if (credential != null) {
      UserModel user = UserModel(
          name: _user!.displayName!,
          image: _user!.photoURL!,
          isOnline: true,
          lastSeen: DateTime.now().toString(),
          uid: _user!.uid);
      await authController.saveUserData(user);
    }
  }

  Future<void> signOut(BuildContext context) async {
    Provider.of<UserProvider>(context, listen: false)
        .updateOnlineStatus(false, context);
    authController.userSignOut();
  }
}
