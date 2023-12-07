import 'package:flutter/material.dart';

class MotsExpressionPage extends StatefulWidget {
  const MotsExpressionPage({super.key});
  @override
  State<MotsExpressionPage> createState() => _MotsExpressionPageState();
}

class _MotsExpressionPageState extends State<MotsExpressionPage> {
  final List<CommonWord> commonWords = [
    CommonWord(
      bambaraWord: 'Kòrò',
      frenchTranslation: 'Lion',
      description: 'Un animal sauvage majestueux.',
    ),
    CommonWord(
      bambaraWord: 'Jigi',
      frenchTranslation: 'Grand',
      description: 'De taille importante.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    CommonWord(
      bambaraWord: 'DIAKITE',
      frenchTranslation: 'Developpeur',
      description: 'Fait du code all time.',
    ),
    // Ajoutez d'autres mots et expressions courantes ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mots et Expressions Courantes'),
      ),
      body: ListView.builder(
        itemCount: commonWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(commonWords[index].bambaraWord),
            subtitle: Text(commonWords[index].frenchTranslation),
            onTap: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(commonWords[index].bambaraWord),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Traduction: ${commonWords[index].frenchTranslation}'),
            SizedBox(height: 16),
            Text(commonWords[index].description),
            // Ajoutez d'autres détails du mot si nécessaire
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
            },
            child: const Text('Fermer'),
          ),
        ],
      );
    },
  );
},
          );
        },
      ),
    );
  }
}

class CommonWord {
  final String bambaraWord;
  final String frenchTranslation;
  final String description;

  CommonWord({
    required this.bambaraWord,
    required this.frenchTranslation,
    required this.description,
  });
}

class WordDetailsPage extends StatelessWidget {
  final CommonWord word;

  WordDetailsPage({required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word.bambaraWord),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Traduction: ${word.frenchTranslation}'),
            SizedBox(height: 16),
            Text(word.description),
            // Ajoutez d'autres détails du mot si nécessaire
          ],
        ),
      ),
    );
  }
}

