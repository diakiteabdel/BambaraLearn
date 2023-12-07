import 'package:bambara_learn/pages/Contribuer.dart';
import 'package:flutter/material.dart';

class Chap3lecon1 extends StatefulWidget {
  const Chap3lecon1({super.key});

  @override
  State<Chap3lecon1> createState() => _Chap3lecon1State();
}

class _Chap3lecon1State extends State<Chap3lecon1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec l'icône de retour
            Container(
              padding: EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: Colors.green, // Couleur de l'en-tête
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Leçon 1 : Les Verbes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Animation de titre
            SizedBox(height: 30),
            Center(
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 50 * (1 - value)),
                      child: Text(
                        'Les Verbes en Bambara',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Contenu de la leçon avec animations si nécessaire
            // ... Ajoutez ici le contenu de votre leçon avec des widgets Text, etc.

            // Exemple : Liste des sections
            SectionWidget(
              title: 'PRÉSENT',
              content:
                  'Le présent s\'utilise avec l\'auxiliaire bɛ (à l\'affirmatif) / tɛ (au négatif)\nVERBE TRANSITIF (donc avec un complément d\'objet) :\nMANGER = KA DUN (to eat) ; riz = maalo ; ne = je\nje mange du riz => ne bɛ maalo dun ; je ne mange pas le riz => ne tɛ maalo dun\nRemarque : la phrase s\'écrit toujours sous la forme = SUJET + bɛ/tɛ + COD + VERBE',
            ),

            SectionWidget(
              title: 'PASSÉ',
              content:
                  'VERBE TRANSITIF (avec complément d\'objet) :\nLe passé transitif s\'écrit avec "ye" (à l\'affirmatif) / "ma" (au négatif)\nACHETER = KA SAN (to buy) ; orange = lenburu\nJ\'ai acheté des oranges => ne ye lenburu san ; je n\'ai pas acheté d\'oranges => ne ma lenburu san\nVERBE INTRANSITIF :\nLe passé intransitif s\'écrit avec les terminaisons "-ra" "-la" "-na" (à l\'affirmatif) / "ma" (au négatif)\nPARTIR = KA TAA (to go) ; COURIR = KA BOLI (to run) ; PASSER = KA TƐMƐN (to spend, to pass)\nje suis parti => ne taara ou ne taala ; j\'ai couru => ne bolila ; je suis passé => ne tɛmɛnna ; je ne suis pas parti => ne ma taa ; je n\'ai pas couru => ne ma boli ; je ne suis pas passé => ne ma tɛmɛn',
            ),

            SectionWidget(
              title: 'IMPARFAIT',
              content:
                  'Pour construire le passé il suffit d\'ajouter le mot tun avant le verbe :\nje suis à Bamako --> ne be Bamako j\'étais à Bamako --> ne tun be Bamako',
            ),

            SectionWidget(
              title: 'FUTUR',
              content:
                  'Il est traduit par "bɛna" (à l\'affirmatif) et "tɛna" (au négatif)\nVERBE TRANSITIF :\nMANGER : KA DUN\nJe mangerai du riz => ne bɛna kini dun ; je ne mangerai pas de riz => ne tɛna kini dun\nVERBE INTRANSITIF :\nPLEURER = KA KASI\nje pleurerai => ne bɛna kasi ; je ne pleurerai pas => ne tɛna kasi',
            ),

            SectionWidget(
              title: 'Participe',
              content:
                  'Participe passé\n-len\nParticipe présent\n-to n b\'a fè ka taa est le bon énoncé\ntableau\nbekabe ka-ra / -la / -nayetun betun katun be katun -ra / -la / -natun ye.',
            ),

            SizedBox(
              height: 20,
            ),
                    Align(
                          alignment: Alignment.center,
                        child: ElevatedButton(
                   onPressed: () {
                
                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ContributionPage()),
                     );
                   },

                     style: ElevatedButton.styleFrom(
                                   primary: Colors.green,
                                   onPrimary: Colors.white, 
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20.0), 
                                                 ),
                    ),
                    
                    child: Text('Contribuer'),
              
                       ),
                 ),
                      SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

// Widget réutilisable pour afficher une section
class SectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const SectionWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 18),
          ),
        ],
                    
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Chap3lecon1(),
  ));
}