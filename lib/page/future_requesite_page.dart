import 'dart:convert';
import 'package:flutter_application_1/Widget/aguardando_widget.dart';
import 'package:flutter_application_1/Widget/erro_widget.dart';
import 'package:flutter_application_1/page/principal_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import '../models/moedas.dart';
import 'future_page2.dart';

//Inicio das constantes da URL
const request = "https://api.hgbrasil.com/finance?key=33bdfb08";
const host = "api.hgbrasil.com";
const path = "/finance";
const fragment = {"key": "33bdfb08"};
//Fim das constantes da URL

Future<Map> getData() async {
  Uri url = Uri.https(host, path, fragment);
  var response = await http.get(url);
  return json.decode(response.body);
}



class ConversoMoeda extends StatefulWidget {
   ConversoMoeda({super.key});

  @override
  State<ConversoMoeda> createState() => _ConversoMoedaState();
}

class _ConversoMoedaState extends State<ConversoMoeda> {
  Moedas moedas = Moedas();

  @override
  Widget build(BuildContext context) {
    print('Build reset: ${moedas.reset}');
    print('Build resete_erro: ${moedas.reset}');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("\$  Conversor  \$"),
        titleTextStyle: const TextStyle(fontSize: 32, color: Colors.black),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
        IconButton(onPressed: () {  
            setState(() {
            moedas.reset = !moedas.reset;
          });
          },
          icon: moedas.resete_erro ? Icon(Icons.system_update, color: Colors.black,) : moedas.reset ? Icon(Icons.refresh_outlined, color:Colors.black) : Icon(Icons.system_update, color: Colors.black,),
          )
        ],
      ),
      body:moedas.resete_erro?Future2(moedas: moedas): moedas.reset ? PrincipalPage(moedas) : Future2(moedas: moedas),
    );
  }

  
}



