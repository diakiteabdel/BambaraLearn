import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class CoursAudioPage extends StatefulWidget {
  const CoursAudioPage({Key? key}) : super(key: key);

  @override
  _CoursAudioPageState createState() => _CoursAudioPageState();
}

class _CoursAudioPageState extends State<CoursAudioPage> {
  final List<Map<String, String>> coursAudioList = [
    {
      'titre': 'Cours Audio 1.mp3',
      'description': 'Description du Cours Audio 1.mp3',
      'audioUrl': 'assets/audios/audio1.m4a'
    },
    {
      'titre': 'Cours Audio 2.mp3',
      'description': 'Description du Cours Audio 2.mp3',
      'audioUrl': 'assets/audios/audio2.m4a'
    },
    {
      'titre': 'Cours Audio 3.mp3',
      'description': 'Description du Cours Audio 3.mp3',
      'audioUrl': 'assets/audios/audio3.m4a'
    },
    // Ajoutez d'autres cours audio au besoin
  ];

  late final AssetsAudioPlayer audioPlayer;
  String currentAudio = '';

  @override
  void initState() {
    super.initState();
    audioPlayer = AssetsAudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio(String audioAsset) {
    if (currentAudio == audioAsset) {
      // Si le même audio est en cours de lecture, arrêtez-le
      audioPlayer.stop();
      setState(() {
        currentAudio = '';
      });
    } else {
      // Sinon, commencez à lire le nouvel audio
      audioPlayer.open(Audio(audioAsset));
      audioPlayer.play();
      setState(() {
        currentAudio = audioAsset;
      });
    }
  }

  // Afficher le popup avec la minuterie
  void ShowCours(String audioUrl) {
    playAudio(audioUrl);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lecture en cours'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Titre de l\'audio'),
              StreamBuilder(
                stream: audioPlayer.currentPosition,
                builder: (context, snapshot) {
                  final Duration position = snapshot.data ?? Duration.zero;
                  return Text(position.toString());
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                audioPlayer.stop().whenComplete(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cours en Audio'),
      ),
      body: ListView.builder(
        itemCount: coursAudioList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.audio_file_outlined),
              ),
              title: Text(
                "${coursAudioList[index]['titre']}",
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("${coursAudioList[index]['description']}"),
              tileColor: Colors.green,
              trailing: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
              onTap: () {
                ShowCours(coursAudioList[index]['audioUrl']!);
              },
            ),
          );
        },
      ),
    );
  }
}
