import 'package:flutter/material.dart';
import 'package:country_app/Views/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries',
      theme: ThemeData(

        primarySwatch: Colors.indigo,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: countryList(),
    );
  }
}


