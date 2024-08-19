import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:maintenance_app/models/user_model.dart';

class UserController {
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('User');

  Future<void> addUser(UserModel user, String docId) async {
    try {
      await userCollection.doc(docId).set(user.toMap());
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await userCollection.where(
          'email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return UserModel.fromMap(data);
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
    return null;
  }
}