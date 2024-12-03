// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CommonCircleAvtar extends StatelessWidget {
  final String tittle;
  final VoidCallback ontap;
  final ImageProvider image;
  const CommonCircleAvtar({
    super.key,
    required this.tittle,
    required this.ontap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: ontap,
              child: CircleAvatar(
                radius: 25,
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            tittle,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
