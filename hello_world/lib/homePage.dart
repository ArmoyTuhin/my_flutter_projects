import 'package:flutter/material.dart';
import 'package:hello_world/drawe.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body:
          Container(
            child: LiquidSwipe(pages: [ Container(color: Colors.brown,),
              Container(color: Colors.blueGrey,),
              Container(color: Colors.deepPurple,),
              Container(color: Colors.white30,),],),

          ),

      drawer: HomeDrawer(),
    );
  }
}