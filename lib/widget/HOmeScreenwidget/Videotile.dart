// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Vidiotile extends StatefulWidget {
  const Vidiotile({super.key});

  @override
  State<Vidiotile> createState() => _VidiotileState();
}

class _VidiotileState extends State<Vidiotile> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  List<String> assetVideo = ['images/vidio.mp4', "images/vidio2.mp4"];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(assetVideo[0]);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
