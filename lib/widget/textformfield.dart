// // // ignore_for_file: prefer_const_constructors

// // import 'package:flutter/material.dart';

// // class Textformfieldwidget extends StatelessWidget {
// //   final String hinttext;
// //   final String labetext;
// //   final TextEditingController controler;
// //   const Textformfieldwidget(
// //       {super.key,
// //       required this.hinttext,
// //       required this.labetext,
// //       required this.controler});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 45,
// //       child: TextFormField(
// //         cursorColor: (Colors.black),
// //         controller: controler,
// //         decoration: InputDecoration(
// //           enabledBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide:
// //                 BorderSide(color: (Colors.black)), // Border color when enabled
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide:
// //                 BorderSide(color: (Colors.black)), // Border color when focused
// //           ),
// //           hintText: hinttext,
// //           labelText: labetext,
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// //         ),

// //       ),
// //     );
// //   }
// // }
// // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Textformfieldwidget extends StatelessWidget {
  final String hinttext;
  final String labetext;
  final TextEditingController controler;
  final String? Function(String?)? validator; // Accept custom validation logic
  String? validationtext;

  Textformfieldwidget({
    super.key,
    required this.hinttext,
    required this.labetext,
    required this.controler,
    this.validator, // Allow custom validator to be passed
    this.validationtext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: (Colors.black),
      controller: controler,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: (Colors.black)), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: (Colors.black)), // Border color when focused
        ),
        hintText: hinttext,
        labelText: labetext,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $labetext'; // Default error message if field is empty
            }
            return null; // No error
          },
    );
  }
}
