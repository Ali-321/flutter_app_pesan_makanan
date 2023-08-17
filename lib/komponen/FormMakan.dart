import 'package:flutter/material.dart';

class FormMakan extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const FormMakan({Key? key, required this.title, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Container(
          color: Colors.amberAccent,
          child: TextField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
