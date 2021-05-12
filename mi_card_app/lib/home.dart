import 'package:flutter/material.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Mona_Lisa-restored.jpg/200px-Mona_Lisa-restored.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
