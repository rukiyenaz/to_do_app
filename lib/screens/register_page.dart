import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController pwController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService=Provider.of<AuthService>(context);
    bool _isObscure =true;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up"),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText:"name",
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "email",
              ),
            ),
            TextField(
              controller: pwController,
              decoration: InputDecoration(
                labelText:"password",
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _isObscure=!_isObscure;
                  });
                }, icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off))
              ),
              
              obscureText: _isObscure,
            ),
            ElevatedButton(onPressed: (){
               try {
                  authService.signUp(nameController.text.trim(),emailController.text.trim(), pwController.text.trim());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("hesap oluşturuldu")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('hesap oluşturulamadı ${e.toString()}'))
                  );
                }
            }, child: Text("Sign Up"))
          ],
        ),),
    );
  }
}