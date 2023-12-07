import 'package:flutter/material.dart';

class ModifierMot2Pass extends StatefulWidget {
  const ModifierMot2Pass({super.key});

  @override
  State<ModifierMot2Pass> createState() => _ModifierMot2PassState();
}

class _ModifierMot2PassState extends State<ModifierMot2Pass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier le Mot de Passe'),
      ),
    );
  }
}
