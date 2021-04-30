import 'package:flutter/material.dart';
import 'package:rokkhi_door_sensor/screens/listScreen.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListScreen();
  }
}
