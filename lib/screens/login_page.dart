import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController pwController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    final authService=Provider.of<AuthService>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('email'),
                hintText: 'ornek@gmail.com'
              ),
            ),
            TextField(
              controller: pwController,
              decoration: const InputDecoration(
                label: Text('password')
              ),
            ),
            ElevatedButton(
              onPressed: (){
                try {
                  authService.signIn(emailController.text.trim(), pwController.text.trim());
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('giriş yapılamadı ${e.toString()}'))
                  );
                }
              }, child: Text('log in')),
          ],
        ),),
        

    );
  }
}