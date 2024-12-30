import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/models/user_model.dart';

abstract class AuthService {
  Future<UserModel?> signIn(String email, String password);
  Future<UserModel?> signUp(String name, String email, String password);
  Future<void> signOut();
  Stream<User?> get onAuthStateChanged;
  void dispose();
}