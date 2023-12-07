



import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Chap1lecon1 extends StatefulWidget {
  const Chap1lecon1({Key? key}) : super(key: key);

  @override
  State<Chap1lecon1> createState() => _Chap1lecon1State();
}

class _Chap1lecon1State extends State<Chap1lecon1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

final AudioCache _audioCache = AudioCache(prefix: 'sounds/');
  final List<List<TextEditingController>> textControllers = List.generate(
    6,
    (row) => List.generate(
      5,
      (col) => TextEditingController(),
    ),
  );

  final List<String> bambaraAlphabet = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "ɛ",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "ŋ",
    "o",
    "ɔ",
    "p",
    "r",
    "s",
    "t",
    "u",
    "w",
    "y",
  ];

   late AudioPlayer _audioPlayer;

  @override
  void dispose() {
    for (var row in textControllers) {
      for (var controller in row) {
        controller.dispose();
      }
    }
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
     _audioPlayer = AudioPlayer();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _colorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(_controller);

    _controller.repeat(reverse: true);

    _audioPlayer = AudioPlayer();
    // Initialiser les contrôleurs de texte avec les lettres de l'alphabet
    for (int row = 0; row < 6; row++) {
      for (int col = 0; col < 5; col++) {
        textControllers[row][col].text = bambaraAlphabet[row * 5 + col];
      }
    }
  }

  // Méthode pour jouer un fichier audio associé à une lettre
  void playAudio(String letter) {
  // Construire le chemin du fichier audio
  final audioPath = 'sounds/$letter.mp3';
  // Charger et jouer le fichier audio
 _audioPlayer.play(audioPath as Source);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 16, bottom: 80),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Text(
                  "L'alphabet banmana",
                  style: TextStyle(
                    fontSize: 24,
                    color: _colorAnimation.value,
                  ),
                );
              },
            ),
            // Utilisation d'Expanded pour ramener la liste au milieu
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: bambaraAlphabet.length,
              itemBuilder: (context, index) {
                final row = index ~/ 5;
                final col = index % 5;
                final textController = textControllers[row][col];
                final letter = textController.text;

                return ElevatedButton(
                  onPressed: () => playAudio(letter),
                  child: Text(
                    letter,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          
             GridView.builder(
               shrinkWrap: true,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 5,
                 crossAxisSpacing: 4.0,
                 mainAxisSpacing: 4.0,
               ),
               itemCount: 25,
               itemBuilder: (context, index) {
                 final row = index ~/ 5;
                 final col = index % 5;
                 final textController = textControllers[row][col];
                 final letter = textController.text;
                return ElevatedButton(
                  onPressed: () => playAudio(letter),
                  child: Text(
                    letter,
                    style: TextStyle(
                       fontSize: 18,
                   ),
                   ),
                 );
               },
             ),
          ],
        ),
      ),
    );
  }
}

