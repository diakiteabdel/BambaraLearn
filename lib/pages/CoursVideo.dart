import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CoursVideo(),
    );
  }
}

class CoursVideo extends StatefulWidget {
  const CoursVideo({Key? key}) : super(key: key);

  @override
  _CoursVideoState createState() => _CoursVideoState();
}

class _CoursVideoState extends State<CoursVideo> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  late StreamController<Duration> _positionStreamController;
  late Stream<Duration> _positionStream;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();

    _positionStreamController = StreamController<Duration>();
    _positionStream = _positionStreamController.stream;
  }

  Future<void> _initializeVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.asset('assets/videos/video1.mp4');
    await _videoPlayerController.initialize();

    _videoPlayerController.addListener(() {
      _positionStreamController.add(_videoPlayerController.value.position);
    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9, // Ajustez cela en fonction de votre vidéo
      autoPlay: false,
      looping: false,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    _positionStreamController.close();
    super.dispose();
  }

  void playPauseVideo() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
      // Afficher le popup avec la minuterie
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lecture en cours'),
            content: Column(
              children: [
                Text('Titre de la vidéo'),
                StreamBuilder(
                  stream: _positionStream,
                  builder: (context, snapshot) {
                    final Duration position = snapshot.data as Duration? ?? Duration.zero;
                    return Text(position.toString());
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cours Vidéo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: _chewieController.videoPlayerController!.value.isInitialized
            ? GestureDetector(
                onTap: playPauseVideo,
                child: Chewie(controller: _chewieController),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}