import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ModifierProfilPage extends StatefulWidget {
  const ModifierProfilPage({Key? key}) : super(key: key);

  @override
  _ModifierProfilPageState createState() => _ModifierProfilPageState();
}

class _ModifierProfilPageState extends State<ModifierProfilPage> {
  File? _image;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Fonction pour valider les données
  bool _validateData() {
    if (_usernameController.text.isEmpty || _emailController.text.isEmpty) {
      // Afficher une boîte de dialogue ou un message d'erreur si des champs sont vides.
      return false;
    }

    return true;
  }

  // Fonction pour enregistrer les modifications
  void _saveChanges() {
    if (_validateData()) {
      // Enregistrez les modifications ici
      String username = _usernameController.text;
      String email = _emailController.text;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier le Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(),
            const SizedBox(height: 16.0),
            const Text('cliquer pour modifier votre profil'),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Nom Utilisateur'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Adresse E-mail'),
            ),
            const SizedBox(height: 16.0),
            /*ElevatedButton(
              onPressed: _selectImage,
              child: const Text('Choisir une photo'),
            ),
            */
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Enregistrer les modifications'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: _selectImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null ? const Icon(Icons.camera_alt, size: 40) : null,
      ),
    );
  }
}
