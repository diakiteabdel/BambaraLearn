import 'package:bambara_learn/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Utilisez le service d'authentification
            User? user = await _authService.registerUserWithEmailAndPassword(
              "test@example.com",
              "password",
              "",
              ""
            );

            if (user != null) {
              // L'utilisateur est connecté
              print("Connecté en tant que ${user.email}");
            } else {
              // La connexion a échoué
              print("Échec de la connexion");
            }
          },
          child: const Text('Se connecter'),
        ),
      ),
    );
  }
}
