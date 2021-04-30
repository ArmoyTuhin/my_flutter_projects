import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providersampleapplication/modalClass.dart';
import 'package:provider/provider.dart';

class approot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter provider example"),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Counter()),
          ],
          child: _MyHomePage(),
        ));
  }
}

class _MyHomePage extends StatelessWidget {
  var buildCount = 0;


  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  void _decrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).decrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).counterValue;
    //print("build count: ${buildCount++}");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text('Your build count $buildCount'),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          RaisedButton(
            onPressed: () => _incrementCounter(context),
            child: Icon(Icons.add),

          ),

          RaisedButton(
            onPressed: () => _decrementCounter(context),
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
