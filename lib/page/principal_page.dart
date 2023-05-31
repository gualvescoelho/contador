import 'package:flutter_application_1/models/moedas.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {


  PrincipalPage(this.moedas,{Key? key}): super(key: key);

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  Moedas moedas;//valor de 1 dolar em reais
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

  @override
  Widget build(BuildContext context) {

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