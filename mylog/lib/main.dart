import 'package:flutter/material.dart';
import 'package:mylog/json.dart';

void main()
{
runApp(MaterialApp(
  home: jsonParsing(),
  title: "testApp",
));
}
class testApp extends StatefulWidget {
  @override
  _testAppState createState() => _testAppState();
}

class _testAppState extends State<testApp> {
  String _value = "What To know my Name?";

   onclicked(String value){
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "Test App"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text(_value),
            RaisedButton(
              onPressed: () => onclicked("Tuhin"),
              child: Text(
                "Know"
              ),
              hoverColor: Colors.blue,

            )
          ],
        ),
      )
    );
  }
}

