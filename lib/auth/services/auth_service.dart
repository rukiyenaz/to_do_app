import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth/models/user_model.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore= FirebaseFirestore.instance;

  UserModel? _currentUser;

  //kullanıcı bilgilerini al
  UserModel? get currentUser =>_currentUser;



  //kulanıcı durum değişikliğini kontrol et
  AuthService(){
    _auth.authStateChanges().listen((User? user){
      if (user!=null) {
        _fetchUserDetails(user.uid);
      }else{
        _currentUser=null;
      }
    });
  }

  //kullanıcı bilgilerini firestoredan alma
  Future<void> _fetchUserDetails(String uid)async{
    try {
      DocumentSnapshot snapshot=await _firebaseFirestore.collection('users').doc(uid).get();
    _currentUser=UserModel.fromJson(snapshot.data() as Map<String,dynamic>);
    notifyListeners();
    } catch (e) {
      throw Exception("kullanıcı bilgisi alınmadı $e");
    }
  }

  //giriş yap
  Future<void> signIn(String email,String password) async{
   try {
     await _auth.signInWithEmailAndPassword(email: email, password: password);
   } catch (e) {
     throw Exception('giriş hatası $e');
   }
  }

  //kayıt yap
  Future<void> signUp(String name,String email, String password) async{
    try {
      //firebaseAuth kullanıcı oluştur
      UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);

      //kullanıcıyı firestore'da sakla
      UserModel userModel=UserModel(id: userCredential.user!.uid, name: name, email: email);
      await _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set(userModel.toJson());

      _currentUser=userModel;
      notifyListeners();


    } catch (e) {
      throw Exception('kayıt hatası $e');
    }    
  }

  //çıkış yap
  Future<void> signOut() async{
    await _auth.signOut();
    _currentUser=null;
    notifyListeners();
  }
}