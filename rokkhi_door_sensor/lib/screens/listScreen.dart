import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:rokkhi_door_sensor/network/DoorSensorDataResponse.dart';
import 'package:rokkhi_door_sensor/network/getToken.dart';
import 'package:rokkhi_door_sensor/screens//drawerScreen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int listLength;
  final url = 'http://api.rokkhi.com:8000/iot';
  getToken tokenClass = getToken();
  var listItemCount = 200;
  // var identifier = new Map();
  var tokenHolder;
  bool allStatusFlag = false;

  void handleClick(String value) {
    switch (value) {
      case '10 status':
        listItemCount = 10;
        break;
      case '20 status':
        listItemCount = 20;
        break;
      case '100 status':
        listItemCount = 100;
        break;
      case 'All status':
        allStatusFlag = true;
        // listItemCount = 1000;
        break;
    }

    setState(() {
      this.getData();
    });
  }

  Future<String> getData() async {
    tokenClass.firebaseCloudMessaging_Listeners();
    var response = await http.get(url);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rokkhi Door Sensor"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0.00,
          backgroundColor: Color(0xFFFF3300),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'refresh icon',
              onPressed: () {
                setState(() {
                  this.getData();
                });
              },
            ),
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {
                  '10 status',
                  '20 status',
                  '100 status'
                } /*, 'All status'*/
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: 500,
              //color:Colors.blueGrey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "T.D:${listLength}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(
                        "Door Status",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        "Mac Address",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: this.getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    List data = json.decode(snapshot.data);
                    List<DoorSensorDataResponse> sensorData = List<DoorSensorDataResponse>();
                    data.forEach((e) => sensorData.add(DoorSensorDataResponse.fromJson(e)));
                    List<DoorSensorDataResponse> reversedData = sensorData.reversed.toList(); //reversing the list
                    listLength = reversedData.length;

                   /* var macList = new List();
                    for (int i = 0; i < reversedData.length; i++) {
                      if (!macList
                          .contains(reversedData[i].data.macAddressOfDevice)) {
                        macList.add(reversedData[i].data.macAddressOfDevice);
                      }
                    } *///storing unique mac address in a list

                    return ListView.builder(
                      itemCount: listItemCount,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            isThreeLine: true,
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 44,
                                maxHeight: 44,
                              ),
                              child:reversedData[index].data.doorStatus=="open"?Image.asset('assets/openDoor.png', fit: BoxFit.cover,height: 40,width: 30,):Image.asset('assets/closedDoor.png', fit: BoxFit.cover,height: 40,width: 30,),
                            ),

                            title:
                                Text("${reversedData[index].data.doorStatus}",textAlign: TextAlign.center,style:TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold), ),
                            trailing: Text(
                                "${reversedData[index].data.macAddressOfDevice}"),
                            subtitle: Column(
                          children: <Widget>[
                            Text("${reversedData[index].date}"),
                            Text("Battery Status: ${reversedData[index].data.batteryStatus}" ),
                            /*Text("SSID :  ${reversedData[index].data.sSID}"),
                            Text(" IP Address : ${reversedData[index].data.ipAddress}"),*/
                          ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        drawer: DrawerScreen(),
      ),
    );
  }
}
