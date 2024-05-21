import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegram_copy/data/user_data/user_data.dart';

class AuthService {
  final FirebaseAuth _instanceAuth = FirebaseAuth.instance;
  final FirebaseFirestore _instanceStore = FirebaseFirestore.instance;

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await _instanceAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> register(
      UserData userRegisterData, String password) async {
    try {
      UserCredential userCredential =
          await _instanceAuth.createUserWithEmailAndPassword(
              email: userRegisterData.email, password: password);
      UserData newUser =
          userRegisterData.copyWith(uid: userCredential.user!.uid);
      _instanceStore.runTransaction((transaction) async {
        _instanceStore.collection("/users").add(newUser.toJson());
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> logout() async {
    try {
      await _instanceAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
