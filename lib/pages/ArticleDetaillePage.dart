import 'package:flutter/material.dart';

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({super.key});

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenus de Article'),
      ),
    );
  }
}
