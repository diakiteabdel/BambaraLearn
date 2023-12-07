import 'package:audioplayers/audioplayers.dart';
import 'package:bambara_learn/pages/Chapitre1.Page.dart';
import 'package:flutter/material.dart';
import 'package:bambara_learn/pages/Chap1Lecon1.dart';
import 'package:bambara_learn/pages/CulturalRessourcePage.dart';
import 'package:bambara_learn/pages/DictionaryPage.dart';
import 'package:bambara_learn/pages/ProfilPage.dart';
import 'package:bambara_learn/pages/accueil_page.dart';
import 'package:bambara_learn/pages/historyPage.dart';
import 'package:bambara_learn/pages/initial.page.dart';

class Chap1lecon2 extends StatefulWidget {
  const Chap1lecon2({super.key});

  @override
  State<Chap1lecon2> createState() => _Chap1lecon2State();
}
class _Chap1lecon2State extends State<Chap1lecon2> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Leçon 2 : Genre / cɛnimusoya',
                    style: TextStyle(
                      
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Le bambara ne connait pas de genre grammatical. Pour indiquer qu\'un animal (..) est masculin on peut utiliser le suffixe "-cè", et pour la féminité on utilise "-muso".',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Par exemple:\n\n'
                'wara        -->  lion\n'
                'warace      -->  lion masculin\n'
                'waramuso    -->  lionne',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
                                 
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Si vous possédez quelques connaissances sur le sujet, vous pouvez les partager en éditant dès à présent; en cliquant sur le bouton “Contribuer”.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            // Ajoutez ici des éléments visuels supplémentaires si nécessaire
          ],
        ),

           

      ),
    );
  }
}

