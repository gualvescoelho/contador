import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/future_requesite_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



void main() async{
  runApp(MyApp());
  print("oi");
}

class MyApp extends StatelessWidget {
   MyApp( {super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ConversoMoeda(),
      /*theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          )),
    );*/
    );
  }
}
