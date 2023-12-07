

import 'package:flutter/material.dart';

class ContribMotsExprePage extends StatefulWidget {
  

  @override
  _ContribMotsExprePageState createState() => _ContribMotsExprePageState();
}

class _ContribMotsExprePageState extends State<ContribMotsExprePage> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();
  final TextEditingController _exampleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Nouveau Mot/Expression'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _wordController,
              decoration: InputDecoration(labelText: 'Mot/Expression'),
            ),
            TextField(
              controller: _meaningController,
              decoration: InputDecoration(labelText: 'Signification'),
            ),
            TextField(
              controller: _exampleController,
              decoration: InputDecoration(labelText: 'Exemple d\'Utilisation'),
            ),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour soumettre le formulaire
                _submitForm();
              },
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
  // Récupérez les valeurs des champs du formulaire
  String word = _wordController.text;
  String meaning = _meaningController.text;
  String example = _exampleController.text;

  // Vérifiez si les champs requis sont renseignés
  if (word.isEmpty || meaning.isEmpty || example.isEmpty) {
    // Affichez un message d'erreur à l'utilisateur s'il manque des informations
    // (vous pouvez utiliser une boîte de dialogue, un SnackBar, etc.)
    // Exemple avec un SnackBar :
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Veuillez remplir tous les champs'),
        duration: Duration(seconds: 2),
      ),
    );
    return; // Arrêtez l'exécution de la fonction si des champs sont vides
  }

  // Effectuez des opérations avec les données, par exemple, les envoyer à une API
  // (remplacez cette partie avec la logique réelle de votre application)

  // Exemple : Affichez les données dans la console
  print('Mot/Expression: $word');
  print('Signification: $meaning');
  print('Exemple d\'Utilisation: $example');

  // Vous pourriez également appeler une fonction pour effectuer d'autres opérations
  // par exemple, envoyer les données à une API
  // sendFormDataToAPI(word, meaning, example);

  // Réinitialisez les contrôleurs de texte après avoir traité le formulaire
  _wordController.clear();
  _meaningController.clear();
  _exampleController.clear();

  // Vous pouvez également naviguer vers une autre page ou effectuer d'autres actions
}
}