import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_page.dart';
import 'package:to_do_app/screens/login_page.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key ,required this.userSnapshot }) : super(key: key); 
  final AsyncSnapshot<User?> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if(userSnapshot.connectionState==ConnectionState.active){
      return userSnapshot.hasData ? HomePage() : LoginPage();
  }
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
}