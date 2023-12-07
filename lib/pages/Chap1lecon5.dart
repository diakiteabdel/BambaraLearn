import 'package:bambara_learn/pages/Contribuer.dart';
import 'package:flutter/material.dart';

class Chap1lecon5 extends StatefulWidget {
  const Chap1lecon5({super.key});

  @override
  State<Chap1lecon5> createState() => _Chap1lecon5State();
}

class _Chap1lecon5State extends State<Chap1lecon5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête de la leçon
            Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Leçon 5 : Les adverbes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),

            // Contenu de la leçon
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle('Adverbes expressifs'),
                  buildAdverb('kok', 'dureté, solidité'),
                  buildAdverb('tep', 'kolikoli\nnotion de rempli'),
                  buildAdverb('kak', 'notion d\'un trait'),
                  buildAdverb('koki', 'avec aplomb'),

                  buildSectionTitle('Adverbes en ko-'),
                  buildAdverb('kokura', 'encore'),
                  buildAdverb('kosebe', 'très/beaucoup'),
                  buildAdverb('Kotchama', 'quelque chose de trop'),
                  buildAdverb('konyuman', 'quelque chose de bien, à nouveau'),
                  buildAdverb('Kojugu', 'quelque chose de mal'),

                  buildSectionTitle('Adverbes de manière'),
                  buildAdverb('dogodogonin', 'refuge, cachette'),
                  buildAdverb('donidoni', 'doucement'),
                  buildAdverb('manamana', 'sans raison, pour rien, sans égard'),
                  buildAdverb('sebekoro', 'intensif'),
                  buildAdverb('balakabalaka', 'précipitamment'),
                  buildAdverb('nemenemenin', 'doucement'),
                  buildAdverb('damateme', 'exagérément'),
                  buildAdverb('kolokolo', 'peu'),
                  buildAdverb('batara', 'facile, léger'),

                  // ... Autres sections
                ],
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Naviguer vers la page Contribuer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContributionPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Contribuer'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget buildAdverb(String term, String definition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          term,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          definition,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
