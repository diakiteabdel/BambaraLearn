import 'package:bambara_learn/pages/Chap2Lecon1.dart';
import 'package:bambara_learn/pages/Chap2Lecon2.dart';
import 'package:bambara_learn/pages/Chap2Lecon3.dart';
import 'package:flutter/material.dart';

class Chap2Page extends StatefulWidget {
  const Chap2Page({Key? key}) : super(key: key);

  @override
  State<Chap2Page> createState() => _Chap2PageState();
}

class _Chap2PageState extends State<Chap2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bouston de retourµ
            const SizedBox(
              height: 30,
            ),

            Container(
              alignment: Alignment.bottomLeft, // Aligner en bas à gauche
              padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 5,
                  top: 20), // Ajuster le padding selon vos besoins
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.green),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Barre de recherche
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // Boutons des leçons
            const SizedBox(
              height: 100,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Naviguer vers la page de la leçon 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Chap2lecon1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 135, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Leçon 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Naviguer vers la page de la leçon 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Chap2lecon2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 135, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Leçon 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Naviguer vers la page de la leçon 3
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Chap2lecon3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 135, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Leçon 3',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    // Naviguer vers la page de la leçon 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Chap2lecon1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 135, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Ajouter leçon',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
