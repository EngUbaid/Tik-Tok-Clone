import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tiktok/Modal/kids_modal.dart';
import 'package:tiktok/widget/HOmeScreenwidget/HomepageSidebar.dart';
import 'package:tiktok/widget/HOmeScreenwidget/Video_detail.dart';
import 'package:video_player/video_player.dart';

// Your API model class (KidsModal) should be here or imported

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isfollowing = false;
  late PageController _pageController;
  late List<VideoPlayerController> _videoControllers =
      []; // Initialize as empty list
  List<String> videoUrls = [];
  bool isLoading = true;
  List<Data> videoDataList = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchVideoUrls(); // Fetch video URLs
  }

  // Method to fetch videos from the API
  Future<void> fetchVideoUrls() async {
    const String apiUrl = 'http://kids.three60.app/api/videos';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Deserialize the response body into KidsModal
        final kidsModal = KidsModal.fromJson(json.decode(response.body));

        // Extract the video URLs
        setState(() {
          videoDataList = kidsModal.data!;
          videoUrls = kidsModal.data!.map((video) => video.video!).toList();

          // Initialize video controllers after data is fetched
          _videoControllers = videoUrls
              .map((url) => VideoPlayerController.network(url)
                ..initialize().then((_) {
                  setState(() {}); // Refresh UI after initialization
                }))
              .toList();

          // Start the first video
          _videoControllers.first.play();
          _videoControllers.first.setLooping(true);
          isLoading = false; // Set loading to false after data is loaded
        });
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (error) {
      print('Error fetching videos: $error');
    }
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
      body: isLoading
          ? Center(
              child: Lottie.asset('images/loading.json',
                  height: 50, width: 50, fit: BoxFit.cover))
          : PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              scrollDirection: Axis.vertical,
              itemCount: videoUrls.length,
              itemBuilder: (context, index) {
                final controller = _videoControllers[index];
                final videoData = videoDataList[index];
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
                            : Lottie.asset('images/loading.json',
                                height: 50, width: 50, fit: BoxFit.cover)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            child: VaidioDetail(
                              name: videoData.user ?? "no user",
                              decsription: videoData.description ?? '',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
    );
  }
}
