import 'package:flutter/material.dart';
import 'package:tiktok/Screens/Profile_Screen/fullscreenvidio.dart';
import 'package:tiktok/widget/profilebuton.dart';

import 'package:video_player/video_player.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List viewlist = [
    "123",
    "222",
    "444",
    "66",
    "777",
    "888",
    "9999",
    "345",
    "35366",
    "75687",
    "545",
    "110k",
    "110k",
  ];

  final List<String> videoPaths = [
    'images/vidio.mp4',
    "images/vidio2.mp4",
    'images/vidio3.mp4',
    "images/vidio4.mp4",
  ];
  List<VideoPlayerController> _videoControllers = [];

  @override
  void initState() {
    super.initState();
    for (String path in videoPaths) {
      _videoControllers.add(VideoPlayerController.asset(path)
        ..initialize().then((_) {
          setState(
              () {}); // Ensure the video player updates after initialization
        }));
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: backroundcolor,
        centerTitle: true,
        title: const Text(
          'username',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_rounded)),
          Image.asset(
            "images/outlineshare.png",
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1695653422557-3b85c1d6d061?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHx8'),
              ),
              const Text(
                '@ubaidullah',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 9,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Likes',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profileButtons(
                    tittle: 'Follow',
                    textcolor: Colors.white,
                    ontap: () {},
                    color: Color.fromRGBO(244, 67, 54, 1),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  profileButtons(
                    tittle: 'Messege',
                    ontap: () {},
                    color: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("bio"),
              const SizedBox(
                height: 10,
              ),
              const Text(''),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: videoPaths.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemBuilder: (context, index) {
                  //String pathv = 'Assets/Vadioes/vadioone.mp4';
                  // VideoPlayerController videoPlayerController =
                  //     VideoPlayerController.asset(pathv);
                  String path = videoPaths[index];
                  VideoPlayerController controller = _videoControllers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenVideo(
                            videoPaths: videoPaths,
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                            height: 500,
                            width: 300,
                            child: controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: VideoPlayer(controller),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator())),
                        Positioned(
                            bottom: 5,
                            left: 4,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.view_module,
                                  size: 10,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${viewlist[index]}",
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ))
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
