// ignore_for_file: body_might_complete_normally_catch_error, avoid_print

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_exchange_online/data/models/user_model.dart';
import 'package:the_exchange_online/data/repository/user_repository/user_repo.dart';

class FirebaseUserRepository implements UserRepository {
  final _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> addUserData(UserModel user) async {
    await _userCollection
        .doc(user.id)
        .set(user.toMap())
        .catchError((error) => print(error));
  }

  @override
  Stream<UserModel> loggedUserStream(UserModel user) {
    return _userCollection
        .doc(user.id)
        .snapshots()
        .map((doc) => UserModel.fromMap(doc.data()!));
  }

  @override
  Future<UserModel> getUserById(String uid) async {
    final doc = await _userCollection.doc(uid).get();
    return UserModel.fromMap(doc.data()!);
  }

  @override
  Future<void> updateUserData(UserModel updatedUser) async {
    await _userCollection.doc(updatedUser.id).get().then((doc) async {
      if (doc.exists) {
        // update
        await doc.reference.update(updatedUser.toMap());
      }
    }).catchError((error) {});
  }

  @override
  Future<void> removeUserData(UserModel newUser) async {
    await _userCollection
        .doc(newUser.id)
        .delete()
        .catchError((error) => print(error));
  }

  ///Singleton factory
  static final FirebaseUserRepository _instance =
      FirebaseUserRepository._internal();

  factory FirebaseUserRepository() {
    return _instance;
  }

  FirebaseUserRepository._internal();
}
