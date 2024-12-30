import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/services/auth_service.dart';
import 'package:to_do_app/auth/services/firebase_service.dart';
import 'package:to_do_app/auth/widget/auth_widget.dart';
import 'package:to_do_app/auth/widget/auth_widget_builder.dart';
import 'package:to_do_app/tasks/models/save_task.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        Provider<AuthService>(create: (_)=>FirebaseAuthService()),
        ChangeNotifierProvider<SaveTask>(create: (_)=>SaveTask())
      ],
      child: AuthWidgetBuilder(builder: (BuildContext context, AsyncSnapshot<User?> userSnapshot){
        return MaterialApp(
          home: AuthWidget(userSnapshot: userSnapshot),
        );
      },)
    ),
    );
  }
}

