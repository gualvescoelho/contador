import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){print("object");}, child: Text('Botãoss elevadoss', style: TextStyle(color: Colors.amber, fontSize: 32),));
  }
}