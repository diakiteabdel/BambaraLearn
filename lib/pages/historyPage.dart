import 'package:bambara_learn/pages/ContePage.dart';
import 'package:bambara_learn/pages/EmpireMali.dart';
import 'package:bambara_learn/pages/LegendeLocale.dart';
import 'package:bambara_learn/pages/Recit_page.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('History'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 80,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                color: Colors.grey,
                child: Image.asset(
                  'assets/images/culture.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Voyagez à travers les époques et découvrez le Mali d\'hier, une nation dont l\'histoire a façonné le présent.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AutofillHints.birthday,
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecitPage()),
                        );
                      },
                      child: cultureCard(
                        imageUrl: 'assets/images/images (25).jpeg',
                        text: "Récit / lankaleli",
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContePage()));
                      },
                      child: cultureCard(
                        imageUrl: 'assets/images/images (58).jpeg',
                        text: "Contes / Talenw",
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LegendeLocalePage()));
                      },
                      child: cultureCard(
                          imageUrl: 'assets/images/images (61).jpeg',
                          text: "Légendes locale / Sigida la nsiirinw"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmpireMaliPage()));
                      },
                      child: cultureCard(
                        imageUrl:
                            'assets/images/faces-of-empires-past-tshirt-illustrations-civilisation-malienne_961038-3689.jpg',
                        text: "L'Empire du MALI / MALI mansamara",
                      ),
                    ),
                  ),
                ],
              )
              // Ajoutez d'autres éléments ici...
            ],
          ),
        ),
      ),
    );
  }
}

class cultureCard extends StatelessWidget {
  cultureCard({
    super.key,
    required this.imageUrl,
    required this.text,
  });
  String imageUrl;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        ),
        height: 150,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
