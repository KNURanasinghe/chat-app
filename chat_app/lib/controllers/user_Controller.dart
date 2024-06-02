

import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final users = FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getAllUsers() {
    return users.snapshots();
  }
}