import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> { 
  String motRecherche = "";
  List<Word> getdictionaryData() {
    return dictionaryData
        .where((mot) =>
            mot.title.toLowerCase().contains(motRecherche.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            TextField(
              decoration: const InputDecoration(
                hintText: 'Rechercher un mot...',
              ),
              onSubmitted: (searchTerm) {
                // Appeler la fonction pour récupérer les données du dictionnaire
                fetchDictionaryData(searchTerm);
              },
              onChanged: (value) {
                setState(() {
                  motRecherche = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Liste des mots
            Expanded(
              child: ListView.builder(
                itemCount: getdictionaryData()
                    .length, // Remplacez par la vraie liste de mots
                itemBuilder: (context, index) {
                  final word = getdictionaryData()[index];
                  return ListTile(
                    title: Text(word.title),
                    subtitle: Text(word.description),
                    onTap: () {
                      // Afficher la définition complète du mot
                      showDefinitionDialog(context, word);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour afficher la définition complète du mot
  void showDefinitionDialog(BuildContext context, Word word) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(word.title),
          content: Text(word.fullDefinition),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  // Fonction pour récupérer les données du dictionnaire
  Future<void> fetchDictionaryData(String searchTerm) async {
    // Implémentez la logique pour effectuer la requête vers l'API
    // et mettre à jour la liste dictionaryData avec les résultats.
  }
}

// Modèle de mot
class Word {
  final String title;
  final String description;
  final String fullDefinition;

  Word({
    required this.title,
    required this.description,
    required this.fullDefinition,
  });
}

// Liste factice de données du dictionnaire (à remplacer par les données réelles)
final List<Word> dictionaryData = [
  Word(
    title: 'ɔridinatɛri:  ',
    description: 'Ordinateur',
    fullDefinition: '- Ordinateur: Un dispositif électronique utilisé pour le traitement de l\'information.',
  ),
  Word(
    title: 'klaviyeti (klaviyeti).',
    description: 'Clavier',
    fullDefinition: 'Clavier - Un périphérique d\'entrée qui permet à l\'utilisateur d\'entrer des données en appuyant sur des touches, chaque touche représentant une lettre, un chiffre ou une fonction spécifique.',
  ),
  Word(
    title: 'Ekaran',
    description: 'Ecran',
    fullDefinition: 'Ekaran: Écran - Un dispositif d\'affichage qui présente les informations visuelles générées par l\'ordinateur.',
  ),
  Word(
    title: 'Disiki gɛlɛn',
    description: 'Disque dur',
    fullDefinition: 'Disiki gɛlɛn: Un dispositif de stockage de données à long terme qui conserve les fichiers et programmes même lorsque l\'ordinateur est éteint.',
  ),
  Word(
    title: 'Projektɛri',
    description: 'Projecteur',
    fullDefinition: 'Projektɛri: Un appareil optique électronique utilisé pour projeter des images ou des présentations sur une surface, généralement dans le cadre de présentations ou de projections cinématographiques.',
  ),
  Word(
    title: 'Kumakanfɔlanba',
    description: 'Haut parleur.',
    fullDefinition: 'Kumakanfɔlanba: Un haut-parleur, ou hautparleur, est un transducteur électroacoustique destiné à produire des sons à partir d\'un signal électrique.',
  ),
  Word(
    title: 'Kaboûsi',
    description: 'Pistolet',
    fullDefinition: 'Kaboûsi: Le pistolet est une arme de poing dont la chambre est intégrée au canon ou en permanence alignée avec lui',
  ),
  Word(
    title: 'Sara',
    description: 'Solde',
    fullDefinition: 'La solde représente la somme d\'argent régulière versée à un employé en échange de ses services',
  ),
  Word(
    title: 'Pampara',
    description: 'Surface',
    fullDefinition: 'Pampara: La surface est une mesure qui représente l\'étendue bidimensionnelle d\'une zone ou d\'une région',
  ),
  // Ajoutez d'autres mots ici
];
