import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_with_provider/counter_provider/data_class.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    print("build count: ${buildCount++}");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Your build count $buildCount'),
          Text(
            '${context.watch<Counter>().counterValue}',
            style: Theme.of(context).textTheme.headline4,
          ),
          RaisedButton(
            onPressed: () => context.read<Counter>().incrementCounter(),
            child: Icon(Icons.add),

          ),

         RaisedButton(
           onPressed: () => context.read<Counter>().decrementCounter(),
           child: Icon(Icons.remove),
         )
        ],
      ),
    );
  }
}
