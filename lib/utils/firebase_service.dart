import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  // Utilisez une méthode statique pour initialiser Firebase.
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}

class FirebaseServiceWidget extends StatefulWidget {
  const FirebaseServiceWidget({Key? key}) : super(key: key);

  @override
  State<FirebaseServiceWidget> createState() => _FirebaseServiceWidgetState();
}

class _FirebaseServiceWidgetState extends State<FirebaseServiceWidget> {
  @override
  Widget build(BuildContext context) {
    // Vous pouvez utiliser cette classe pour des opérations spécifiques liées à Firebase.
    return Container();
  }
}