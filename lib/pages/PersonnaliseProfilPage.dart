import 'package:flutter/material.dart';

class PersonnaliseProfil extends StatefulWidget {
  const PersonnaliseProfil({super.key});

  @override
  State<PersonnaliseProfil> createState() => _PersonnaliseProfilState();
}

class _PersonnaliseProfilState extends State<PersonnaliseProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnaliser le Profil'),
      ),
    );
  }
}
