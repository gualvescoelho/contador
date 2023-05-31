import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/moedas.dart';
import 'package:flutter_application_1/page/principal_page.dart';

import '../Widget/aguardando_widget.dart';
import '../Widget/erro_widget.dart';
import 'future_requesite_page.dart';

class Future2 extends StatelessWidget {
  Future2({required this.moedas,Key? key}) : super(key: key);

  Moedas moedas ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {

          if (
          snapshot.connectionState  == ConnectionState.none
          || snapshot.connectionState == ConnectionState.waiting) {

            return const AguardandoPage();

          } else if (snapshot.hasError) {

            moedas.resete_erro = true;

            return const ErroPage();
          } else {
            moedas.resete_erro = false;
            moedas.dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
            moedas.euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
            return PrincipalPage(moedas);
          }
        });
  }
}
