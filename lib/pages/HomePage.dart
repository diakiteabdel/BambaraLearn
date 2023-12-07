import 'package:bambara_learn/Components/Cards/CoursModule.dart';
import 'package:bambara_learn/Components/Cards/level_card.dart';
import 'package:bambara_learn/Components/Carrousselle/Carrousselle.dart';
import 'package:bambara_learn/pages/Chap2.page.dart';
import 'package:bambara_learn/pages/Chap3.page.dart';
import 'package:bambara_learn/pages/Chap4.page.dart';
import 'package:bambara_learn/pages/ProfilPage.dart';
import 'package:flutter/material.dart';

import "Chapitre1.Page.dart";

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ScrollController scrollController = ScrollController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'BambananLearn',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilPage()));
                      },
                      tooltip: 'Profil',
                      mini: true,
                      child: const Icon(Icons.person),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Carrousselle(),
               ),

              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Cours',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Chapitre1page()));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10,
                        child: Stack(
                          children: [
                            Image.asset(
                                'assets/images/groupe-enfants-africains-pretant-attention-classe.jpg',
                                fit: BoxFit.cover),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                color: Colors.black.withOpacity(0.7),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Partie 1',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                    Text('Inscrivez-vous maintenant',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Chap2Page(),
                                )
                                );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10,
                        child: Stack(
                          children: [
                            Image.asset(
                                'assets/images/groupe-enfants-africains-apprenant-ensemble.jpg',
                                fit: BoxFit.cover),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                color: Colors.black.withOpacity(0.7),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Partie 2',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                    Text('Inscrivez-vous maintenant',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Chap3Page()));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10,
                        child: Stack(
                          children: [
                            Image.asset(
                                'assets/images/close-up-pere-apprenant-ecrire-enfant - Copie.jpg',
                                fit: BoxFit.cover),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                color: Colors.black.withOpacity(0.7),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Partie 3',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                    Text('Inscrivez-vous maintenant',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Chap4_page()));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10,
                        child: Stack(
                          children: [
                            Image.asset(
                                'assets/images/groupe-enfants-africains-classe.jpg',
                                fit: BoxFit.cover),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                color: Colors.black.withOpacity(0.7),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Partie 4',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                    Text('Inscrivez-vous maintenant',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Mes cours',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                        width: 80,
                        child: Image.asset("assets/images/5114855.jpg")),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Premier pas',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        Text(
                            'Pour le bambara on utilise l\'alphabet latin\n'
                            'avec quelques additions.',
                            style: TextStyle(fontSize: 10)),
                      ],
                    )
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    //QuizCategory quizCatData = QuizCategory.fromMap(data);

                    return GestureDetector(
                      onTap: () {},
                      child: CoursModuleCard(),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0.0,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Text(
                          'Stat progression',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: GridView.builder(
                          controller: _controller,
                          primary: false,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 100,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: 4,
                          itemBuilder: (BuildContext ctx, index) {
                            return levelCard(
                              Titre: 'Cours',
                              description: 'Niveau de progression cours',
                              value: 52.0,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
