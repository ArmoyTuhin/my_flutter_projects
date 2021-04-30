import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider_tester/main.dart';
import 'package:provider_tester/incremental.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      ChangeNotifierProvider(
       create: (context) =>  letsIncrement(),
        child: MyApp(),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainScreen(),
    );
  }
}
class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider data = Provider(create: null)
    return Scaffold(

      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Column(
        children:<Widget> [
          Text("")
        ],
      ),
    );
  }
}

