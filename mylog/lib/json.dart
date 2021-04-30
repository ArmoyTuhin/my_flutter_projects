import 'package:flutter/material.dart';
import 'package:http/http.dart';

class jsonParsing extends StatefulWidget {
  @override
  _jsonParsingState createState() => _jsonParsingState();
}

class _jsonParsingState extends State<jsonParsing> {
  Future data ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network("https://jsonplaceholder.typicode.com/photos").fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json"),
        ),
      ),
    );
  }
}

class Network
{

  final String url;

  Network(this.url);

  Future fetchData() async{
    print("$url");
    Response response = await get(Uri.encodeFull(url));
    if(response.statusCode == 200)
      {
        print(response.body);
        return response.body;
      }
    else {
      print( response.statusCode);
    }
  }


}