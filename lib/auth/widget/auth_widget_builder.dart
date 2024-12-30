import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/models/user_model.dart';
import 'package:to_do_app/auth/services/auth_service.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<User?>) builder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context,listen: false);
    return StreamBuilder<User?>(
      stream: authService.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        final User? user = snapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider<User>.value(value: user),
            ],
            child: builder(context, snapshot));
        }
        return builder(context, snapshot);
      },
    );
  }
}