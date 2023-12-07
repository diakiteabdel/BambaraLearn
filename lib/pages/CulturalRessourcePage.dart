import 'package:bambara_learn/Components/RessourceCulturelleCard.dart';
import 'package:bambara_learn/main.dart';
import 'package:bambara_learn/pages/ArticlesEdu.dart';
import 'package:bambara_learn/pages/ImageCulturelle.dart';
import 'package:bambara_learn/pages/QuizCulturelle.dart';
import 'package:bambara_learn/pages/VideoCulturelle.dart';
import 'package:flutter/material.dart';

class CulturalRessourcePage extends StatefulWidget {
  const CulturalRessourcePage({super.key});

  @override
  State<CulturalRessourcePage> createState() => _CulturalRessourcePageState();
}

class _CulturalRessourcePageState extends State<CulturalRessourcePage> {
  final ScrollController _scrollCont = ScrollController();

  final List<Map<String, dynamic>> elements = [
    {
      "title": "VIDEO CULTURELLE",
      "description":
          "Explorez la richesse culturelle à travers une collection captivante de vidéos culturelles. Plongez dans des récits fascinants, des performances artistiques et des événements culturels qui célèbrent la diversité et l'héritage de notre monde.",
      "urlToImage": "assets/images/image_1.jpeg",
      "onpress": (BuildContext ctx) => Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) => const VidCult()),
          ),
    },
    {
      "title": "Articles Educatifs",
      "description":
          " Explorez des sujets captivants tels que l'histoire riche, les coutumes ancrées et les traditions vivantes de la culture bambara.",
      "urlToImage": "assets/images/UN0430942 (1).jpg",
      "onpress": (BuildContext ctx) => Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) => const ArticleEducatif()),
          ),
    },
    {
      "title": "Images Culturelles",
      "description":
          "Plongez dans des visuels captivants qui capturent l'essence vibrante de la tradition, de l'art et du mode de vie bambara.",
      "urlToImage": "assets/images/images (31).jpeg",
      "onpress": (BuildContext ctx) => Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) =>  ImageBankPage()),
          ),
    },
    {
      "title": "Quiz Culturels ",
      "description":
          "Plongez dans un monde d'apprentissage ludique où chaque question vous rapproche de la découverte de la richesse culturelle du peuple bambara.",
      "urlToImage": "assets/images/images (22).jpeg",
      "onpress": (BuildContext ctx) => Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) =>  QuizPage()),
          ),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ressource Culturelle',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                itemCount: elements.length,
                shrinkWrap: true,
                controller: _scrollCont,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Map<String, dynamic> ressource = elements[index];
                  return GestureDetector(
                      onTap: () => ressource["onpress"](context),
                      child: actuCard(
                        title: ressource["title"],
                        description: ressource["description"],
                        urlToImage: ressource["urlToImage"],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionButton(BuildContext context, String title, String route) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ArticlesAndLessonsPage extends StatelessWidget {
  const ArticlesAndLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles et Leçons Culturelles'),
      ),
      body: const Center(
        child: Text('Contenu des Articles et Leçons Culturelles'),
      ),
    );
  }
}

class CulturalVideosPage extends StatelessWidget {
  const CulturalVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vidéos Culturelles'),
      ),
      body: const Center(
        child: Text('Contenu des Vidéos Culturelles'),
      ),
    );
  }
}

class CulturalEventsPage extends StatelessWidget {
  const CulturalEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements Culturels'),
      ),
      body: const Center(
        child: Text('Contenu des Événements Culturels'),
      ),
    );
  }
}

class CommonWordsPage extends StatelessWidget {
  const CommonWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mots et Expressions Courantes'),
      ),
      body: const Center(
        child: Text('Contenu des Mots et Expressions Courantes'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'BambaraLearn',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const CulturalRessourcePage(),
      '/articlesAndLessons': (context) => const ArticlesAndLessonsPage(),
      '/culturalVideos': (context) => const CulturalVideosPage(),
      '/culturalEvents': (context) => const CulturalEventsPage(),
      '/commonWords': (context) => const CommonWordsPage(),
    },
  ));
}
