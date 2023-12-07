import 'package:flutter/material.dart';

class ArticleLeconCulturelle extends StatefulWidget {
  const ArticleLeconCulturelle({super.key});

  @override
  State<ArticleLeconCulturelle> createState() => _ArticleLeconCulturelleState();
}


class _ArticleLeconCulturelleState extends State<ArticleLeconCulturelle> {  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles et Leçons Culturelles'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leçon 1 : Salutations en bambara',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Apprenez les salutations de base en bambara pour bien démarrer une conversation.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 20, color: Colors.grey),
            Text(
              'Article : Histoire de la culture bambara',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Explorez l\'histoire fascinante de la culture bambara, de ses origines à nos jours.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 20, color: Colors.grey),
            // Ajoutez d'autres leçons et articles en suivant le même modèle
          ],
        ),
      ),
    );
  }
}