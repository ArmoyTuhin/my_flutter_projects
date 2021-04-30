import 'dart:convert';
import 'package:api_calling/network/network_response.dart';
import 'package:api_calling/network/user_Data_Fetch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'network/UserInfo.dart';
import 'package:provider/provider.dart';
import 'package:api_calling/model.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => GetUserInfoClass()),
      ChangeNotifierProvider(
        create: (_) => GetUserInfoClass(),
      ),
    ], child: ApiClass()),
  );
}

class ApiClass extends StatelessWidget {
  @override
  final phoneControl = TextEditingController();
  String result = '';

  void call(String number) {
    result = number;
    //print("$result");
  }

  @override
  Widget build(BuildContext context) {
    var getUserInfoProvider = Provider.of<GetUserInfoClass>(context, listen: false);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Phone Number", hintText: "Enter Your Number"),
                  keyboardType: TextInputType.number,
                  controller: phoneControl,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.black12),
                    ),
                    child: Text("Send"),
                    onPressed: () async {
                      getUserInfoProvider.getUserInfo(phoneControl.text.toString());
                    },
                  ),
                ),
              ),

              Container(
                child: Consumer<GetUserInfoClass>(
                  builder: (_, data, child) => Text(
                    'Hello, ${data.uName}! How are you?',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
