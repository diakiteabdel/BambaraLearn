import 'package:flutter/material.dart';

class ContributionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de Contribution'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContributionButton(
              context,
              'Ajouter un Nouveau Mot/Expression',
              '/new_word_contribution',
            ),
            _buildContributionButton(
              context,
              'Ajouter une Nouvelle Vidéo Culturelle',
              '/new_video_contribution',
            ),
            // Ajoutez des boutons pour d'autres fonctionnalités
          ],
        ),
      ),
    );
  }

  Widget _buildContributionButton(BuildContext context, String label, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(label),
    );
  }
}