import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem {
  final String title;
  final String videoPath;
  final String imagePath;

  VideoItem(
      {required this.imagePath, required this.title, required this.videoPath});
}

class VidCult extends StatefulWidget {
  const VidCult({Key? key}) : super(key: key);

  @override
  State<VidCult> createState() => _VidCultState();
}

class _VidCultState extends State<VidCult> {
  List<VideoItem> videos = [];
  List<ChewieController>? chewieControllers;

  @override
  void initState() {
    super.initState();

    // Initialiser la liste des vidéos
    videos = [
      VideoItem(
          imagePath: 'assets/images/CVideo_1.png',
          title: "(Leçon 1) - Jɔn nɔ, Jɔn kɔnɔ / L'unité fait la force.",
          videoPath: 'assets/videos/video1.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_5.png',
          title: "(Leçon 2) - Dunia ye danaya, dunia ye doo / Le monde a des côtés sombres et des côtés lumineux",
          videoPath: 'assets/videos/Leçon2.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_1.png',
          title: "(Leçon 3) - Kɔnɔ kura ye baba kɔnɔ kura ye sɔrɔ / L'entente familiale est préférable à la discorde familiale",
          videoPath: 'assets/videos/Leçon3.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_5.png',
          title: "(Leçon 4) - Bi min sɔgɔma denw be ye / La vie est une école sans fin.",
          videoPath: 'assets/videos/Leçon4.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_1.png',
          title: "(Leçon 5) - Bi den foli don kɔnɔ ani / L'apprentissage ne s'arrête jamais.",
          videoPath: 'assets/videos/Leçon5.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_5.png',
          title: "(Leçon 6) - Sɔrɔ ɲɛna ka fɛli ka tɔ / L'amour et le respect sont la base de tout.",
          videoPath: 'assets/videos/Leçon6.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_1.png',
          title: "(Leçon 7) - Ka tɛ fɔli la kɛ / L'habitude rend parfait.",
          videoPath: 'assets/videos/Leçon7.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_5.png',
          title: "(Leçon 8) - Bɛ yɛrɛ jɔn ka /  La patience est une vertu",
          videoPath: 'assets/videos/Leçon8.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_1.png',
          title: "(Leçon 9) - Mali kɛ masa don / La nation malienne est notre fierté.",
          videoPath: 'assets/videos/Leçon9.mp4'),
      VideoItem(
          imagePath: 'assets/images/CVideo_5.png',
          title: "(Leçon 10) -Jigi dugu ni kɔnɔ la / L\'union fait la force.",
          videoPath: 'assets/videos/Leçon10.mp4'),
    ];

    // Initialiser les contrôleurs Chewie pour chaque vidéo
    chewieControllers = videos.map((video) {
      return ChewieController(
        videoPlayerController: VideoPlayerController.asset(video.videoPath),
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: false,
      );
      print(chewieControllers);
    }).toList();
  }

  @override
  void dispose() {
    // Libérer les ressources à la fermeture de la page
    for (var controller in chewieControllers!) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de Vidéos'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(videos[index]
                .imagePath), // Remplacez 'your_image.png' par le chemin de votre image
            title: Text(videos[index].title),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow), // Icône "play"
              onPressed: () {
                // Lancer la lecture de la vidéo lorsqu'un élément est tapé
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                      chewieController: chewieControllers![index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final ChewieController chewieController;

  const VideoPlayerScreen({super.key, required this.chewieController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture Vidéo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.stop), // Utilisez une icône de stop
            onPressed: () {
              chewieController.pause(); // Mettre en pause la vidéo
              chewieController.seekTo(
                  const Duration(seconds: 0)); // Rembobiner la vidéo au début
            },
          ),
        ],
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
