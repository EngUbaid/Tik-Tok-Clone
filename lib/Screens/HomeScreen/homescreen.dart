import 'package:flutter/material.dart';
import 'package:tiktok/widget/HOmeScreenwidget/HomepageSidebar.dart';
import 'package:tiktok/widget/HOmeScreenwidget/Video_detail.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isfollowing = false;
  final List<String> videoUrls = [
    'images/vidio.mp4',
    "images/vidio2.mp4",
    'images/vidio3.mp4',
    "images/vidio4.mp4",
  ];

  late PageController _pageController;
  late List<VideoPlayerController> _videoControllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _videoControllers = videoUrls
        .map((url) => VideoPlayerController.asset(url)
          ..initialize().then((_) {
            setState(() {});
          }))
        .toList();
    _videoControllers.first.play();
    _videoControllers.first.setLooping(true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _onPageChanged(int index) {
    for (var controller in _videoControllers) {
      controller.pause();
    }
    _videoControllers[index].play();
    _videoControllers[index].setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isfollowing = true;
                });
              },
              child: Text(
                "Following",
                style: TextStyle(
                    color: _isfollowing ? Colors.white : Colors.grey,
                    fontSize: _isfollowing ? 18 : 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isfollowing = false;
                });
              },
              child: Text(
                "For you",
                style: TextStyle(
                    color: !_isfollowing ? Colors.white : Colors.grey,
                    fontSize: !_isfollowing ? 18 : 14,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final controller = _videoControllers[index];
          return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Center(
                child: controller.value.isInitialized
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                          });
                        },
                        child: SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: controller.value.size.width,
                              height: controller.value.size.height - 20,
                              child: VideoPlayer(controller),
                            ),
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
                        child: const VaidioDetail(),
                      )),
                  Expanded(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.76,
                    child: const HomepageSidebar(),
                  ))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
