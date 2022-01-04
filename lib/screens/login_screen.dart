import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/registration_screen.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return const SignInScreen(providerConfigs: [
            EmailProviderConfiguration(),
          ]);
        }

        // Render your application if authenticated
        return const RegistrationScreen();
      },
    );
  }
}
