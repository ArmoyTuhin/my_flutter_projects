import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(Body: increment()));
}

class increment extends StatelessWidget {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
