
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
class Video {
  final String titre;
  final String image;

  Video({required this.titre, required this.image});
}

class Annonce extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnnonceState();
  }
}

class AnnonceState extends State<Annonce> {
  List<Video> videos = [];
  late List<ChewieController> _chewieControllers;

  @override
  void initState() {
    super.initState();
    _chewieControllers = [];
    fetchVideos().then((fetchedVideos) {
      setState(() {
        videos = fetchedVideos;
        _initializeChewieControllers();
      });
    });
  }

  Future<List<Video>> fetchVideos() async {
    final response =
    await http.get(Uri.parse("http://10.0.2.2:8080/keneya/annonces"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      List<Video> fetchedVideos = jsonResponse.map((data) {
        return Video(titre: data['titre'], image: data['image']);
      }).toList();

      return fetchedVideos;
    } else {
      throw Exception('Failed to load videos');
    }
  }

  void _initializeChewieControllers() {
    _chewieControllers = videos.map((video) {
      return ChewieController(
        videoPlayerController: VideoPlayerController.network(video.image),
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: false,
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _chewieControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 40,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Image.asset(
                  "assets/images/megaphone.png",
                  width: 188,
                  height: 169,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Annonces",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(videos[index].titre),
                      onTap: () {
                        // Pause toutes les vidéos avant de changer de vidéo
                        for (var i = 0; i < _chewieControllers.length; i++) {
                          if (i != index) {
                            _chewieControllers[i].pause();
                          }
                        }
                        // Jouer ou mettre en pause la vidéo actuelle
                        _chewieControllers[index].videoPlayerController.value.isPlaying
                            ? _chewieControllers[index].pause()
                            : _chewieControllers[index].play();
                      },
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Chewie(
                        controller: _chewieControllers[index],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





















/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosCulturelle extends StatefulWidget {
  const VideosCulturelle({Key? key}) : super(key: key);

  @override
  _VideosCulturelleState createState() => _VideosCulturelleState();
}

class _VideosCulturelleState extends State<VideosCulturelle> {
  late VideoPlayerController _controller;
  late List<String> videoPaths; // Liste de chemins vers les vidéos

  @override
  void initState() {
    super.initState();
    videoPaths = [
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      // Ajoutez d'autres vidéos ici
    ];

    // Utilisez la première vidéo par défaut
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
    body: Center(
      child: FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return InkWell(
              onTap: () {
                _showVideoDialog(context);
              },
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
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

void main() {
  runApp(const MaterialApp(
    home: VideosCulturelle(),
  ));
}
*/