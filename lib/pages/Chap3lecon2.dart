import 'package:bambara_learn/pages/Contribuer.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class Chap3lecon2 extends StatefulWidget {
  const Chap3lecon2({super.key});

  @override
  State<Chap3lecon2> createState() => _Chap3lecon2State();
}

class _Chap3lecon2State extends State<Chap3lecon2> {
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
                    TyperAnimatedText("Leçon 2 : L’emploi de má na et de ní"),
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
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text:
                        'Il existe en bambara deux possibilités de construction, équivalentes par le sens, pour les propositions conditionnelles/temporelles affirmatives ; \n\n'
                        'dans un cas, on emploie la conjonction ní , placée devant la proposition subordonnée ; dans l’autre, la proposition subordonnée est marquée par une marque prédicative, má na, sans correspondant négatif ; ainsi les deux propositions (2a–b) sont strictement de même sens; au négatif (3), une seule possibilité est offerte.\n\n'
                        '(2) a. Sú má na kò à bɛ́ nà .\n‘Quand il fait nuit, il vient’.\n\n'
                        'b. Ní sú kò ra à bɛ̀ nà .\n‘Quand il fait nuit, il vient’.\n\n'
                        '(3) Ní sú má kò , à bɛ́ nà .\n‘S’il ne fait pas nuit, il vient’\n\n'
                        'La comparaison de ces fréquences amène aux observations suivantes : 1° má na figure entre deux et quatre fois plus dans les textes traditionnels que dans les textes modernes, et 2° má na apparaît fortement dans l’écrit non traduit du français.\n\n'
                        'La sous-représentation de má na dans les textes modernes écrits semble bien être une conséquence de la mise en équivalence entre le si du français et le ní du bambara. Dans la plupart des cas en effet, le si du français se traduit obligatoirement par ní , soit que la phrase soit négative, soit qu’il s’agisse d’une proposition non verbale :\n\n'
                        '(4) Ní à le mù so dò n...\n‘Si c’est sa femme…’',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
    