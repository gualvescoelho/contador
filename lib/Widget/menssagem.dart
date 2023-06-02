import 'package:flutter/material.dart';

class Menssagem extends StatelessWidget {
  String text;

  Menssagem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style:const TextStyle(
          color: Colors.amber,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

