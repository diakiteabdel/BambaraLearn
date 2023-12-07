import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bambara_learn/main.dart';
import 'package:flutter/material.dart';

class Chap2lecon1 extends StatefulWidget {
  const Chap2lecon1({super.key});

  @override
  State<Chap2lecon1> createState() => _Chap2lecon1State();
}

class _Chap2lecon1State extends State<Chap2lecon1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.green],
                ),
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
                    'Leçon 1 : Los pronoms',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Voici les correspondances des pronoms en bambara, la deuxième forme est la forme emphatique :',
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(65.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'je - n\', ne',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'tu - i, e',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'il - a, ale',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'nous - an, anw',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'vous - a, aw',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'eux, ils, elles - u, olu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'eux, ceux-la : nounou, olu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Si vous possédez quelques connaissances sur le sujet, vous pouvez les partager en éditant dès à présent; en cliquant sur le bouton “Contribuer”.',
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
              ),
            ),
            // ... Autres
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Naviguer vers la page Contribuer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Contribuer()),
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
}
