import 'dart:convert';
import 'package:api_calling/network/network_response.dart';
import 'package:api_calling/network/user_Data_Fetch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'network/UserInfo.dart';
import 'package:provider/provider.dart';





class GetDataClass extends ChangeNotifier {
  var getUserInfoClass = GetUserInfoClass();

  Future<void> getdata(String string, String phoneControl) async {
    /
    var rawData = await http.post(
        "http://home.api.rokkhi.com/api/v1/common/getIdToken",
        body: jsonEncode(
            {"email": "inrantestcom@test.com", "password": "123456"}),
        headers: {"content-type": "application/json"});
    var responseBody = jsonDecode(rawData.body);
    var mData = GetIdTokenResponse.fromJson(responseBody);


    if (mData.statusCode == 200) {
      Fluttertoast.showToast(
          msg: mData.status,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      getUserInfoClass.getUserInfo(mData.data, phoneControl);
    }
  }
}

class GetUserInfoClass extends ChangeNotifier {
  var uName = "";
  setUName(uNam) {
    this.uName = uNam;
    notifyListeners();
  }

  Future<void> getUserInfo(String token, String phoneControl) async {
    final Map<String, String> headersData = {"authtoken": token};
    final Map<String, String> bodyData = {
      "phoneNumber": phoneControl.toString()
    };

    /* print(headersData);
    print(bodyData);*/

    var rawData = await http.post(
        "http://home.api.rokkhi.com/api/v1/user/getByPhoneNumber",
        body: bodyData,
        headers: headersData);

    var responseBody = jsonDecode(rawData.body);
    // print(responseBody);
    var mData = UserInfo.fromJson(responseBody);

    print(mData.data.name);

    setUName(mData.data.name);
    print("ghjkjhg  ====  " + uName);

  }
}