import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_exchange_online/data/models/user_model.dart';

abstract class AuthRepository {
  User get currentUser;
  String get authException;
  String? get userId;

  Future<void> signUpUser(UserModel newUser, String password);

  Future<void> signInUser(String email, String password);

  Future<void> verify();

  Future<void> resetPassword(String email);

  Future<void> signInWithGoogle();

  bool isVerified();

  bool isSignedIn();

  Future<void> reloadUsers();

  Future<void> signOut();
}
