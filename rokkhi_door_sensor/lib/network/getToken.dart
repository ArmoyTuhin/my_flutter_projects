import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:rokkhi_door_sensor/network/DoorSensorDataResponse.dart';

class getToken
{
  final url = 'http://api.rokkhi.com:8000/iot';
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  void firebaseCloudMessaging_Listeners() {

    _firebaseMessaging.getToken().then((token) {

      tokenPost(token);


    });
  }

   Future tokenPost(String token) async{
    final response = await http.post(url,  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'fcmToken':token,
    }),);

    print(response.statusCode);
}
}
