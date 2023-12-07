import 'package:bambara_learn/pages/CoursAudio.dart';
import 'package:bambara_learn/pages/CoursVideo.dart';
import 'package:flutter/material.dart';

class Chap4_page extends StatefulWidget {
   Chap4_page({ Key? key});

  @override
  State<Chap4_page> createState() => _Chap4_pageState();
}

class _Chap4_pageState extends State<Chap4_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'CHAPITRE 4 : Apprendre le bambara en audio et en vidéo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Barre de recherche
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher...',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Boutons des leçons
            const SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bouton 1 : Cours en Audio
                AnimatedButton(
                  image: 'assets/images/image1.png',
                  text: 'Cours en Audio',
                  onPressed: () {
                    // Naviguer vers la page CoursAudio
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoursAudioPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Bouton 2 : Cours en Vidéo
                AnimatedButton(
                  image: 'assets/images/trur_7bl9_210621-removebg-preview.png',
                  text: 'Cours en Vidéo',
                  onPressed: () {
                    // Naviguer vers la page CoursVideo
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoursVideo()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget réutilisable pour les boutons animés
class AnimatedButton extends StatefulWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;

  const AnimatedButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.blue.shade700 : Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10), // Ajustez la taille du bouton ici
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              height: 30,
              width: 30,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16, // Ajustez la taille du texte ici
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
