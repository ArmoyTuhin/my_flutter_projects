import 'package:flutter/material.dart';
import 'package:flutter_counter_with_provider/counter_provider/simple_counter_with_provider.dart';
import 'package:flutter_counter_with_provider/simple_counter/simple_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
