import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Chap2lecon3 extends StatefulWidget {
  const Chap2lecon3({Key? key}) : super(key: key);

  @override
  State<Chap2lecon3> createState() => _Chap2lecon3State();
}

class _Chap2lecon3State extends State<Chap2lecon3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(16),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  totalRepeatCount: 3,
                  animatedTexts: [
                    TyperAnimatedText('EMPLOI SYNTAXIQUE DU BAMBARA AU FRANÇAIS'),
                    // Ajoutez plus d'animations si nécessaire
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Texte de DIAKITE ABDEL AZIZE KABA',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Ɔ̀npá ri yéán ká bá mannaden nyɛnajɛfɛn yé ́ .',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '‘Or le mpari était notre jeu à nous les Bambara.\n\nàyéàsɔrɔ mà ̀ riyansi másé á nw fɛ jàmana ìn kàn yàn\nles jeux de cartes n’étaient pas encore arrivés dans le pays,\n\n'
                        'dá miye máséyàn : le jeu de dames n’était pas arrivé ici,\n\n'
                        'lì do máséyàn : le jeu de petits chevaux n’était pas arrivé ici,\n\n'
                        'bú lu máséyàn : le jeu de boules n’était pas arrivé ici,\n\n'
                        'fà rajɛ dènínìn bɛɛ nàna ánw fɛ yàn : ce sont les Blancs qui sont venus avec tout ça ici.’\n\n'
                        'Et dans un autre texte, du conteur Musanin, c’est lorsqu’il est question du héros parti travailler à Abidjan que l’emploi de termes français apparaît, et de manière extrême, puisque tous les mots non grammaticaux en (1) sont des emprunts au français.\n\n'
                        'Nòsèri y’i túrune kà tá kisi dɔ́ árete.\nnoceur PFV.TR REFL.tourner INF taxi certain arrêter\n‘Noceur s’est retourné et a fait arrêter un taxi.’\n\n'
                        'L’influence du français au niveau phonétique est assez faible. Les systèmes vocalique et consonantique, y compris pour le bambara véhiculaire (le parler urbain de Bamako, largement employé dans toutes les principales villes maliennes et qui sert de \n\n'
                        'langue de communication sur la quasi-totalité du territoire national) sont inchangés, comme l’est aussi le fonctionnement tonal. On notera cependant le développement de l’usage de phonèmes inexistants ou marginaux en bambara, présents en français :\n\n'
                        ' v, z, ʒ, ʃ (vɛ́ri ‘verre’, zè nerali ‘général’, ʒà rdɛn ‘jardin’, ʃé mizi	 ‘chemise’) ; en milieu urbain, les formes les plus proches du français prédominent, et les formes les moins francisées sont perçues comme anciennes et rurales, \n\n'
                        'ce qui les déprécie aux oreilles des citadins, et accentue leur délaissement (exemple : lá kɔliden et é kɔlden ‘écolier’).',
                  
                  ),
                  // ... Autres textes
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




















