import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Article {
  final String title;
  final String summary;
  final String contentLink;

  Article({
    required this.title,
    required this.summary,
    required this.contentLink,
  });
}

class ArticleEducatif extends StatefulWidget {
  const ArticleEducatif({Key? key}) : super(key: key);

  @override
  State<ArticleEducatif> createState() => _ArticleEducatifState();
}

class _ArticleEducatifState extends State<ArticleEducatif> {
  List<Article> bambaraArticles = [
    Article(
      title: "Médecine traditionnelle bambara",
      summary:
          "Les rites de la médecine traditionnelle bambara et le traitement de la « folie » jinèbana.",
      contentLink:
          "https://www.erudit.org/fr/revues/as/2002-v26-n2-3-as554/007057ar/",
    ),
    Article(
      title: "Les Initiations",
      summary: "D. Zahan, Sociétés d'initiation Bambara",
      contentLink:
          "https://www.persee.fr/doc/hom_0439-4216_1961_num_1_1_366358",
    ),
    Article(
      title: "Bambara Culture",
      summary:
          "LA TERMINOLOGIE DE LA PARENTE EN BAMANA : STRUCTURE D’UN GROUPE LEXICAL.",
      contentLink: "https://llacan.cnrs.fr/PDF/Mandenkan22/22vydrine.pdf",
    ),
    // ... Ajoutez plus d'articles au besoin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARTICLES EDUCATIFS'),
      ),
      body: ListView.builder(
        itemCount: bambaraArticles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchURL(bambaraArticles[index].contentLink);
            },
            child: _buildArticleCard(bambaraArticles[index]),
          );
        },
      ),
    );
  }

  Widget _buildArticleCard(Article article) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(article.summary),
      ),
    );
  }

  // Fonction pour ouvrir le lien URL
  void _launchURL(String url) async {
    print("Trying to launch URL: $url");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Could not launch $url");
      throw 'Could not launch $url';
    }
  }
}
