import 'package:flutter/material.dart';

class FormMakanan extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const FormMakanan({Key? key, required this.title, required this.controller})
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
