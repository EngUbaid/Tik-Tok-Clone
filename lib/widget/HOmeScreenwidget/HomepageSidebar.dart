// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tiktok/widget/HOmeScreenwidget/userprofile.dart';

class HomepageSidebar extends StatefulWidget {
  final int likes;
  final int comment;
  final int save;
  final int share;
  const HomepageSidebar(
      {super.key,
      required this.likes,
      required this.comment,
      required this.save,
      required this.share});

  @override
  State<HomepageSidebar> createState() => _HomepageSidebarState();
}

class _HomepageSidebarState extends State<HomepageSidebar> {
  //   with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  TextStyle style = const TextStyle(color: Colors.white, fontSize: 11);
  // @override
  // void initState() {
  //   super.initState();
  //   _animationController =
  //       AnimationController(vsync: this, duration: Duration(seconds: 6));
  //   _animationController.repeat();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _animationController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _Profile(),
          const SizedBox(
            height: 20,
          ),
          _Sidebarlikes(
              const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
              widget.likes.toString(),
              style),
          const SizedBox(
            height: 15,
          ),
          _Sidebarlikes(
              Image.asset(
                "images/comments.png",
                height: 35,
                width: 35,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              widget.comment.toString(),
              style),
          const SizedBox(
            height: 15,
          ),
          _Sidebarlikes(
              Image.asset(
                "images/save.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              widget.save.toString(),
              style),
          const SizedBox(
            height: 15,
          ),
          _Sidebarlikes(
              Image.asset(
                "images/share.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              widget.share.toString(),
              style),
          const SizedBox(
            height: 20,
          ),
          // AnimatedBuilder(
          //   animation: _animationController,
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Colors.white,
          //           ),
          //           borderRadius: BorderRadius.circular(26),
          //           // image: DecorationImage(
          //           //   fit: BoxFit.cover,
          //           //   image: NetworkImage('https://images.unsplash.com/photo-1699187129235-442d3f1ac069?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D'))
          //         ),
          //         child: CircleAvatar(
          //           radius: 20,
          //           backgroundImage: NetworkImage(
          //               'https://images.unsplash.com/photo-1699187129235-442d3f1ac069?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D'),
          //         ),
          //       ),
          //       CircleAvatar(
          //         radius: 12,
          //         backgroundImage: NetworkImage(
          //             "https://images.unsplash.com/photo-1699147790292-257de5aeed1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8fA%3D%3D"),
          //       )
          //     ],
          //   ),
          //   builder: (context, child) {
          //     return Transform.rotate(
          //       angle: 2 * pi * _animationController.value,
          //       child: child,
          //     );
          //   },
          // )
        ],
      ),
    );
  }

  _Sidebarlikes(Widget iconname, String label, TextStyle style) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: iconname,
        ),
        Text(
          label,
          style: style,
        )
      ],
    );
  }

  _Profile() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const UserProfile();
          },
        ));
      },
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                      image: AssetImage("images/tiktoks.png"),
                      // image: NetworkImage(
                      //     "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: -10,
              child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 20, 4),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Icon(
                    Icons.add,
                    size: 14,
                    color: Colors.white,
                  )),
            )
          ]),
    );
  }
}
