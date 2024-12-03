// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tiktok/widget/HOmeScreenwidget/Video_detail.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatefulWidget {
  final List<String> videoPaths;
  final int initialIndex;

  const FullScreenVideo(
      {super.key, required this.videoPaths, required this.initialIndex});

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  late PageController _pageController;
  late VideoPlayerController _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoController =
        VideoPlayerController.asset(widget.videoPaths[_currentIndex])
          ..initialize().then((_) {
            setState(() {});
            _videoController.play();
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _videoController.pause();
      _videoController =
          VideoPlayerController.asset(widget.videoPaths[_currentIndex])
            ..initialize().then((_) {
              setState(() {});
              _videoController.play();
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: widget.videoPaths.length,
        itemBuilder: (context, index) {
          final controller = _videoController;
          return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Center(
                child: controller.value.isInitialized
                    ? SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: controller.value.size.width,
                            height: controller.value.size.height - 20,
                            child: VideoPlayer(controller),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: const VaidioDetail(
                          name: '',
                          decsription: '',
                        ),
                      )),
                  // Expanded(
                  //     child: SizedBox(
                  //   height: MediaQuery.of(context).size.height / 1.76,
                  //   child: const HomepageSidebar(),
                  // ))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
