import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import '../Widget/menssagem.dart';
import '../models/moedas.dart';

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
    log("Build future_requesite/ConvesorMoeda");
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
          icon:IconFunc(moedas))
        ],
      ),
      body:moedas.resete_erro? Future2(moedas): moedas.reset ? PrincipalPage(moedas) : Future2(moedas),
    );
  }

  
}
Widget IconFunc(Moedas moedas){
  return  moedas.resete_erro ? const Icon(Icons.system_update, color: Colors.black,) :
  moedas.reset ? const Icon(Icons.system_update, color: Colors.black,) : const Icon(Icons.refresh_outlined, color:Colors.black);

}
Widget PrincipalPage(Moedas moedas){
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  //valor de 1 dolar em reais
  // valor de 1 euro em reais


  void _realChanged(String text){
    if(realController.text.isNotEmpty){
      double realText = double.parse(text);
      dolarController.text=(realText/moedas.dolar).toStringAsFixed(2);
      euroController.text =(realText/moedas.euro).toStringAsFixed(2);
    }else{
      dolarController.text = "";
      euroController.text = '';
    }
  }
  void _dolarChanged(String text){
    if(dolarController.text.isNotEmpty) {
      double dolarText = double.parse(text);
      euroController.text = (moedas.dolar* dolarText/moedas.euro).toStringAsFixed(2);
      realController.text = (moedas.dolar* dolarText).toStringAsFixed(2);
    }else{
      realController.text = "";
      euroController.text = '';
    }
  }
  void _euroChanged(String text){
    if(text.isNotEmpty){
      double euroText = double.parse(text);
      dolarController.text=(moedas.euro* euroText/moedas.dolar).toStringAsFixed(2);
      realController.text = (moedas.euro* euroText).toStringAsFixed(2);
    }else{
      realController.text = "";
      dolarController.text = '';
    }
  }

  void resetAll() {
    print('oi');

    realController.text = "";
    euroController.text = "";
    dolarController.text = "";

  }

    resetAll();

    return  SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          const Icon(Icons.monetization_on, size: 130,color: Colors.amber),
          buildTextField(true,"Reais", "R\$ ",realController,_realChanged),

          const Divider(),
          buildTextField(false,"Dólares", "US\$ ", dolarController, _dolarChanged),

          const  Divider(),
          buildTextField(false,"Euro", "EU\$ ",euroController, _euroChanged),

        ],
      ),
    );
  }

buildTextField(bool autofocus,String lable, String prefix,TextEditingController controller,func){

  return TextField(
    autofocus: autofocus,
    controller: controller,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    style: const TextStyle(color: Colors.amber, fontSize: 25),
    decoration: InputDecoration(
      labelText: lable,
      labelStyle:TextStyle(color: Colors.amber,fontSize: 25),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)) ,
      prefixText: prefix,
      hintStyle: TextStyle(color: Colors.amber, fontSize: 20,),

    ),
    onChanged: func,
  );
}

Widget Future2(Moedas moedas){
  return FutureBuilder<Map>(
      future: getData(),
      builder: (context, snapshot) {

        if (
        snapshot.connectionState  == ConnectionState.none
            || snapshot.connectionState == ConnectionState.waiting) {

          return Menssagem(text: "Carregando Dados");

        } else if (snapshot.hasError) {


          return Menssagem(text: "Erro ao Carregar Dados");
        } else {

          moedas.dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
          moedas.euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
          return PrincipalPage(moedas);
        }
      });
}



