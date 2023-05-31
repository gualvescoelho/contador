import 'package:flutter/material.dart';

class AguardandoPage extends StatelessWidget {
  const AguardandoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Carregando Dados",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
