import 'package:flutter/material.dart';
import 'listScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFFF3300),
            ),
            child: Text(
              'Rokkhi Door Sensor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

    ListTile(
            leading: Icon(Icons.search),
            title: Text("Data"),
            ),
 ],
      ),
    );
  }
}
