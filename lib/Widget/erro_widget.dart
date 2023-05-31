import 'package:flutter/material.dart';

class ErroPage extends StatelessWidget {
  const ErroPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Erro ao Carregar Dados",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
