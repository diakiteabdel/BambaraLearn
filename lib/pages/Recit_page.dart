import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecitPage extends StatefulWidget {
  const RecitPage({Key? key}) : super(key: key);

  @override
  State<RecitPage> createState() => _RecitPageState();
}

class _RecitPageState extends State<RecitPage> {
  late YoutubePlayerController _controller;
  final List<Map<String, Object>> _list = [
    {
      'id': "2",
      'name': "Recit1",
      'videourl': "https://www.youtube.com/watch?v=_WHxJ6hTP7s",
      'thumbnailUrl': "assets/images/image_1.jpeg",
    },
    {
      'id': "2",
      'name': "Recit1",
      'videourl': "https://www.youtube.com/watch?v=hEFuVqo69FY",
      'thumbnailUrl': "assets/images/image_1.jpeg"
    },
    {
      'id': "2",
      'name': "Recit1",
      'videourl': "https://www.youtube.com/watch?v=iGV3q3J24Hg",
      'thumbnailUrl': "assets/images/images(60).jpeg"
    },
    // Ajoutez d'autres récits au besoin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Récits'),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final recit = _list[index];
          final String videoId =
              YoutubePlayer.convertUrlToId(recit['videourl'] as String) ?? '';

          return Column(
            children: [
              ListTile(
                title: Text(recit['name'] as String),
                subtitle: Text('ID: ${recit['id']}'),
                leading: Image.asset('assets/images/CVideo_5.png'),//network(recit['thumbnailUrl'] as String),
                onTap: () {
                  // Naviguez vers une page de lecture vidéo ou ouvrez le lecteur vidéo ici
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(videoId: videoId),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class VideoPlayerPage extends StatelessWidget {
  final String videoId;

  const VideoPlayerPage({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture vidéo'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
