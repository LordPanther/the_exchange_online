import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_exchange_online/data/models/user_model.dart';
import 'package:the_exchange_online/data/repository/repository.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _userRepository = FirebaseUserRepository();

  // final UserModel user;

  String _authException = "Authentication Failure";

  ///User dits
  @override
  User get currentUser => _firebaseAuth.currentUser!;

  @override
  String get userId => currentUser.uid;

  @override
  String get authException => _authException;

  @visibleForTesting
  bool isWeb = kIsWeb;

  /// Don't use onAuthChange

  @override
  Future<void> signInUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      switch (error.toString()) {
        case "invalid-email":
          _authException =
              "The email provided is invalid. Please double-check the email address and try again.";
          break;
        case "user-disabled":
          _authException =
              "Your account has been disabled. Please reach out to our support team for further assistance.";
          break;
        case "wrong-password":
          _authException =
              "The password you entered is incorrect. Please ensure you're entering the correct password and try again. If you've forgotten your password, you can reset it through the 'Forgot Password' option.";
          break;
        case "too-many-requests":
          _authException =
              "Too many requests were sent to the server. For security reasons lease try again after 5 minutes.";
          break;
        case "user-token-expired":
          _authException =
              "Your current session has expired. Please sign in again to continue.";
          break;
        case "network-request-failed":
          _authException = "Please check your internet connection.";
          break;
        case "operation-not-allowed":
          _authException =
              "Internal error. Please contact support for further assistance.";
          break;
        default:
          _authException = error.toString();
      }
    }
  }

  @override
  Future<void> signUpUser(UserModel newUser, String password) async {
    if (kDebugMode) {
      print('Method: EmailPassword');
    }
    try {
      var userId = await _firebaseAuth.createUserWithEmailAndPassword(
        email: newUser.email!,
        password: password,
      );
      // Add ID for new user
      var updatedUserDetails = newUser.cloneWith(id: userId.user!.uid);
      // Create new doc in users collection
      await _userRepository.addUserData(updatedUserDetails);
    } on FirebaseAuthException catch (e) {
      switch (e.toString()) {
        case "email-already-in-use:":
          _authException =
              "We're sorry, but the email provided has already been taken. Please double-check the email address and try again.";
          break;
        case "invalid-email":
          _authException =
              "We're sorry, but the email provided is invalid. Please double-check the email address and try again.";
          break;
        case "operation-not-allowed":
          _authException =
              "This operation is not allowed. Please contact support";
          break;
        case "weak-password":
          _authException =
              "The password you entered is not strong enough. Please use a combination of letters, digits and special characters.";
          break;
        case "network-request-failed":
          _authException =
              "Network request error. Please check your internet connection.";
        default:
          "Something went wrong";
      }
    }
  }

  @override
  Future<void> verify() async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user != null) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }

  /// If user is not logged in
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    // if (kDebugMode) {
    //   print('Method: GoogleSignIn()');
    // }
    // try {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //   final GoogleSignInAuthentication? googleAuth =
    //       await googleUser?.authentication;
    //   final OAuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth?.accessToken,
    //     idToken: googleAuth?.idToken,
    //   );
    //   await _firebaseAuth.signInWithCredential(credential);
    // } on FirebaseAuthException catch (e) {
    //   _authException = e.message.toString();
    // }
  }

  @override
  bool isVerified() => _firebaseAuth.currentUser!.emailVerified;

  @override
  bool isSignedIn() => _firebaseAuth.currentUser != null;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut().catchError((error) {
      if (kIsWeb) {
        if (kDebugMode) {
          print(error);
        }
      }
    });
  }

  @override
  Future<void> reloadUsers() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }

  ///Singleton factory
  static final FirebaseAuthRepository _instance =
      FirebaseAuthRepository._internal();

  factory FirebaseAuthRepository() {
    return _instance;
  }

  FirebaseAuthRepository._internal();
}
