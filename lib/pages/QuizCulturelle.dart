import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  String? _selectedOption;
  int _score = 0;
  int _correctAnswers = 0;
  int _incorrectAnswers = 0;

  final List<Question> _questions = [
    // ... (votre liste de questions)
     Question(
      text: "Quelle est la capitale du Mali ?",
      options: ["Bamako", "Dakar", "Abidjan", "Accra"],
      correctOptionIndex: 0,
    ),
    Question(
      text: "Quel est le fleuve qui traverse le Mali ?",
      options: ["Sénégal", "Niger", "Congo", "Nil"],
      correctOptionIndex: 1,
    ),
    Question(
      text:
          "Quel est le célèbre festival musical qui se tient chaque année au Mali ?",
      options: ["Coachella", "Woodstock", "Glastonbury", "Festival au Désert"],
      correctOptionIndex: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz sur le Mali'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Affichage de l'image en haut du quiz
            Image.asset(
              'Assets/images/image_1.jpeg', // Ajoutez le chemin de votre image ici
              height: 100, // Ajustez la hauteur selon vos besoins
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Question ${_currentQuestionIndex + 1}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              _questions[_currentQuestionIndex].text,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            // Affichage du message de réussite ou d'échec
            if (_selectedOption != null)
              _buildAnswerMessage(_selectedOption!,
                  _questions[_currentQuestionIndex].correctOptionIndex),
            ..._buildOptions(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showNextQuestion();
              },
              child: const Text('Suivant'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    return _questions[_currentQuestionIndex].options.map((option) {
      return RadioListTile(
        title: Text(option),
        value: option,
        groupValue: _selectedOption,
        onChanged: (value) {
          setState(() {
            _selectedOption = value;
          });
        },
      );
    }).toList();
  }

  Widget _buildAnswerMessage(String selectedOption, int correctOptionIndex) {
    bool isCorrect = selectedOption ==
        _questions[_currentQuestionIndex]
            .options[_questions[_currentQuestionIndex].correctOptionIndex];
    return Container(
      padding: EdgeInsets.all(8.0),
      color: isCorrect ? Colors.green : Colors.red,
      child: Text(
        isCorrect ? 'Correct !' : 'Incorrect !',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        // Vérifier la réponse et mettre à jour le score
        if (_selectedOption != null &&
            _questions[_currentQuestionIndex]
                    .options[_questions[_currentQuestionIndex].correctOptionIndex] ==
                _selectedOption) {
          _score += 5;
          _correctAnswers++;
        } else {
          _incorrectAnswers++;
        }

        _currentQuestionIndex++;
        _selectedOption = null; // Réinitialiser la sélection
      } else {
        // Afficher un dialogue avec le résultat du quiz
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Résultats du Quiz'),
              content: Column(
                children: [
                  Text('Score: $_score'),
                  Text('Réponses correctes: $_correctAnswers'),
                  Text('Réponses incorrectes: $_incorrectAnswers'),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fermer'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctOptionIndex,
  });
}



/*import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  String? _selectedOption;

  final List<Question> _questions = [
    Question(
      text: "Quelle est la capitale du Mali ?",
      options: ["Bamako", "Dakar", "Abidjan", "Accra"],
      correctOptionIndex: 0,
    ),
    Question(
      text: "Quel est le fleuve qui traverse le Mali ?",
      options: ["Sénégal", "Niger", "Congo", "Nil"],
      correctOptionIndex: 1,
    ),
    Question(
      text:
          "Quel est le célèbre festival musical qui se tient chaque année au Mali ?",
      options: ["Coachella", "Woodstock", "Glastonbury", "Festival au Désert"],
      correctOptionIndex: 3,
    ),
    Question(
      text:
          "Quel est le célèbre musicien malien connu comme le 'Roi de la Musique Africaine' ?",
      options: [
        "Fela Kuti",
        "Salif Keita",
        "Youssou N'Dour",
        "Ali Farka Touré"
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text:
          "Quel est le site historique du Mali inscrit au patrimoine mondial de l'UNESCO ?",
      options: ["Pyramides de Gizeh", "Machu Picchu", "Dogon", "Tombouctou"],
      correctOptionIndex: 3,
    ),
    Question(
      text:
          "Quel est le surnom du Mali, souvent appelé le 'Pays des Hommes Intègres' ?",
      options: [
        "Le Pays du Sourire",
        "Le Pays des Merveilles",
        "Le Pays des Montagnes",
        "Le Pays des Hommes Intègres"
      ],
      correctOptionIndex: 3,
    ),
    Question(
      text: "Quelle est la religion majoritaire au Mali ?",
      options: ["Christianisme", "Hindouisme", "Bouddhisme", "Islam"],
      correctOptionIndex: 3,
    ),
    Question(
      text: "Quelle est la signification du mot 'Bambara' en malien ?",
      options: ["Homme", "Rivière", "Sagesse", "Français"],
      correctOptionIndex: 0,
    ),
    Question(
      text: "Quelle est la monnaie officielle du Mali ?",
      options: ["Franc CFA", "Euro", "Dollar", "Livre Sterling"],
      correctOptionIndex: 0,
    ),
    Question(
      text: "Quelle est la langue officielle du Mali ?",
      options: ["Français", "Anglais", "Espagnol", "Allemand"],
      correctOptionIndex: 0,
    ),
    Question(
      text: "Quel est le plus grand fleuve qui traverse le Mali ?",
      options: ["Niger", "Nil", "Sénégal", "Congo"],
      correctOptionIndex: 0,
    ),
    Question(
      text: "Quel est le plat traditionnel malien à base de riz et de viande ?",
      options: ["Couscous", "Jollof Rice", "Tô", "Biryani"],
      correctOptionIndex: 2,
    ),

    // Ajoutez plus de questions au besoin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz sur le Mali'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              _questions[_currentQuestionIndex].text,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ..._buildOptions(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showNextQuestion();
              },
              child: const Text('Suivant'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    return _questions[_currentQuestionIndex].options.map((option) {
      return RadioListTile(
        title: Text(option),
        value: option,
        groupValue: _selectedOption,
        onChanged: (value) {
          setState(() {
            _selectedOption = value;
          });
        },
      );
    }).toList();
  }

  void _showNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedOption = null; // Réinitialiser la sélection
      } else {
        // Afficher les résultats du quiz ou une nouvelle page
        // en fonction de la logique que vous souhaitez implémenter.
        // Vous pouvez également afficher un dialogue de fin de quiz ici.
        print("Quiz terminé !");
      }
    });
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctOptionIndex,
  });
}
*/
