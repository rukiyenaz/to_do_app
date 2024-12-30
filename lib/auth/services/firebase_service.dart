import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth/models/user_model.dart';
import 'package:to_do_app/auth/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore= FirebaseFirestore.instance;

  UserModel? _userFromFirebase(User user){
    if(user==null){
      return null;
    }
    return UserModel(id: user.uid,name: user.displayName.toString(), email: user.email.toString());
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }
  
  @override
  // TODO: implement onAuthStateChanged
  Stream<User?> get onAuthStateChanged { return _firebaseAuth.authStateChanges();}

  
  @override
  Future<UserModel?> signIn(String email, String password) async{
    final UserCredential userCredential= await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCredential.user!);
  }
  
  @override
  Future<void> signOut() async{
    return _firebaseAuth.signOut();;
  }
  
  @override
  Future<UserModel?> signUp(String name, String email, String password) async {
    final UserCredential userCredential= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
      'name':name,
      'email':email,
    });
    return _userFromFirebase(userCredential.user!);
  }



}