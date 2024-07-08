import 'package:flutter/material.dart';

class profileButtons extends StatelessWidget {
  final String tittle;
  final Color? textcolor;
  final VoidCallback ontap;
  final Color color;
  const profileButtons({
    super.key,
    required this.tittle,
    this.textcolor,
    required this.ontap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          //border: Border.all(color: bordercolor)
        ),
        child: Center(
          child: Text(
            tittle,
            style: TextStyle(
              fontSize: 13,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
