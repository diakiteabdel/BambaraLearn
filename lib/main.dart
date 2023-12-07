import 'package:bambara_learn/firebase_options.dart';
import 'package:bambara_learn/pages/LoginPage.dart';
import 'package:bambara_learn/pages/ScreenWithBottomNavationBar/ScreenWithBottomNavationBar.dart';
import 'package:bambara_learn/pages/connexion.Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  await init();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: //ScreenWithBottomNav(),
    //LoginPage(),
    //VidCult(),
    //HistoryPage(),
    //Carrousselle(),
    //BottomNavig(),
    //Chap4_page(),
    //Chap3Page(),
    //Chap2Page(),
    //Video(),
    //CoursVideo()
    //ArticlesAndLessonsPage(),
    //ArticleLeconCulturelle(),
    //CoursVideo(),
    //GeneralPage(),
    //InitializationPage(),
    connexionpage(),
    //Contribuer(),
    //VideosCulturelle(),
    //CulturalRessourcePage(),
    //MotsExpressionPage()
    //VideosCulturelle(),
    //ArticlesAndLessonsPage(),
    //CulturalRessourcePage(),
    //Homepage(),
    //HistoryPage(),
    //DictionaryPage(),
    //InitializationPage(),
    //ModifierMot2Pass(),
    //ModifierProfilPage(),
    //Page_Cours(),
    
    //PageViewer(),
    //PersonnaliseProfil(),
    //VideosCulturelle(),
    //ProfilPage(),
    //MotsExpressionPage(),
    //VideosCulturelle(),
  ));
}

class VideosCulturelle extends StatefulWidget {
  const VideosCulturelle({Key? key}) : super(key: key);

  @override
  _VideosCulturelleState createState() => _VideosCulturelleState();
}

class _VideosCulturelleState extends State<VideosCulturelle> {
  late VideoPlayerController _controller;
  late List<String> videoPaths;

  @override
  void initState() {
    super.initState();
    videoPaths = [
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      // Ajoutez d'autres vidéos ici
    ];

    _controller = VideoPlayerController.asset(videoPaths[0])
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vidéos Culturelles'),
      ),
      body: ListView.builder(
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _controller.pause();
              _controller = VideoPlayerController.asset(videoPaths[index])
                ..initialize().then((_) {
                  setState(() {});
                  _controller.play();
                  _showVideoDialog(context);
                });
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Vidéo ${index + 1}'),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showVideoDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              const SizedBox(height: 8),
              const Text('Liste des Vidéos :'),
              const SizedBox(height: 8),
              _buildVideoList(),
            ],
          ),
          actions: [
            TextButton(
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

  Widget _buildVideoList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _controller.pause();
              _controller = VideoPlayerController.asset(videoPaths[index])
                ..initialize().then((_) {
                  setState(() {});
                  _controller.play();
                });
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
            },
            child: Container(
              width: 100,
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text('Vidéo ${index + 1}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Contribuer extends StatelessWidget {
  const Contribuer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mettez en place la page Contribuer ici
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contribuer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/history');
          },
          child: const Text('Aller à la page d\'histoire'),
        ),
      ),
    );
  }
}
