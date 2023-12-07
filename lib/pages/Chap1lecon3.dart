import 'package:bambara_learn/pages/Contribuer.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Chap1lecon3 extends StatefulWidget {
  const Chap1lecon3({Key? key}) : super(key: key);

  @override
  _Chap1lecon3State createState() => _Chap1lecon3State();
}

class _Chap1lecon3State extends State<Chap1lecon3> {
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
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Leçon 3 : Bambara/Pluriels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Pour indiquer le pluriel on utilise le suffixe -w en bambara.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  _buildAnimatedText('femme - muso\nfemmes - musow'),
                  SizedBox(height: 20),
                  _buildAnimatedText('Mali cew - les hommes du Mali\nwara - lion\nwaraw - lions'),
                  SizedBox(height: 20),
                  _buildAnimatedText('La prononciation de -w est proche de "u" soit : ou'),
                  SizedBox(height: 20),
                  _buildAnimatedText('Exception:\nenfant - den\nEnfants-denw (prononcé : dénw)'),
                  SizedBox(height: 20),
                  Text(
                    'Leçon 3 : Bambara/Pluriels',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildAnimatedText(
                    'Si vous possédez quelques connaissances sur le sujet, vous pouvez les partager en éditant dès à présent; en cliquant sur le bouton “Contribuer”.',
                  ),
                  SizedBox(height: 20),
                  
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedText(String text) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: TextStyle(fontSize: 18),
          speed: Duration(milliseconds: 50),
        ),
      ],
    );
  }
}