import 'package:flutter/material.dart';
import 'package:tiktok/Screens/Profile_Screen/edit_Profile.dart';
import 'package:tiktok/Screens/Profile_Screen/fullscreenvidio.dart';
import 'package:tiktok/widget/profilebuton.dart';

import 'package:video_player/video_player.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List viewlist = [
    "123",
    "222",
    "444",
    "66",
    "777"
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'username',
          style: TextStyle(fontSize: 14),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black12,
                    // backgroundImage: NetworkImage(
                    //     'https://images.unsplash.com/photo-1695653422557-3b85c1d6d061?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHx8'),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 19,
                          )))
                ],
              ),
              const Text(
                '@ubaidullah',
                style: TextStyle(fontWeight: FontWeight.normal),
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
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profileButtons(
                    tittle: 'Edit Profile',
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const EditProfilescreen();
                        },
                      ));
                    },
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  profileButtons(
                    tittle: 'Share Profile',
                    ontap: () {},
                    color: Colors.black12,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome to my profile",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              ),
              const Text(
                'TikTok Studio',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              ),
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

                  // ChewieController chewieController = ChewieController(
                  //   videoPlayerController: videoPlayerController,
                  //   aspectRatio: 1.0,

                  //   autoPlay:
                  //       false, // Set this to true if you want videos to play automatically
                  //   looping: false,
                  // );

                  // return Chewie(controller: chewieController);

                  // return InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return ProfileVideoes(imagepath: pathv);
                  //       },
                  //     ));
                  //   },
                  //   // child:  Container(
                  //   // color: Colors.green,
                  //   child: Chewie(controller: chewieController),
                  // );
                  // return Container(
                  //   color: Colors.green,
                  //   child: Center(
                  //     child: Text("video $index"),
                  //   ),
                  // );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
