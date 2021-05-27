import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
               children: <Widget>[

                 CircleAvatar(backgroundColor: Colors.red,
                   backgroundImage: NetworkImage("http://www.amazopedia.com/wp-content/uploads/2019/07/62280-mona_lisa-wiki.jpg"),
                   radius: 50.0,
                   ),
                 Text(
                   "Mona Lisa",
                   style: TextStyle(
                     fontSize: 40.0,
                     fontFamily: 'Pacifico',
                     color: Colors.white,
                     fontWeight: FontWeight.bold

                   ),
                 ),
                 Text(
                   "FLUTTER DEVELOPER",
                   style: TextStyle(
                       fontFamily: 'Source Sans',
                       color: Colors.teal.shade100,
                   ),
                 ),
               ],
              ),
        ),
      ),
    );
  }
}
