import 'dart:convert';
import 'package:api_calling/network/network_response.dart';
import 'package:api_calling/network/user_Data_Fetch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'network/UserInfo.dart';
import 'package:provider/provider.dart';

class GetAuthToken {
  Future<String> getData() async {
    var rawData = await http.post(
        "http://home.api.rokkhi.com/api/v1/common/getIdToken",
        body: jsonEncode(
            {"email": "inrantestcom@test.com", "password": "123456"}),
        headers: {"content-type": "application/json"});
    var responseBody = jsonDecode(rawData.body);
    var mData = GetIdTokenResponse.fromJson(responseBody);

    if (mData.statusCode == 200) {
      return mData.data;
    }
    return "";
  }
}

class GetUserInfoClass extends ChangeNotifier {
  var uName = "";

  Future<void> getUserInfo(phoneNumber) async {
    GetAuthToken authToken = GetAuthToken();

    var token = await authToken.getData();

    final Map<String, String> headersData = {"authtoken": token};
    final Map<String, String> bodyData = {"phoneNumber": phoneNumber};

    var rawData = await http.post(
        "http://home.api.rokkhi.com/api/v1/user/getByPhoneNumber",
        body: bodyData,
        headers: headersData);

    var responseBody = jsonDecode(rawData.body);
    print(responseBody);
    var mData = UserInfo.fromJson(responseBody);
    uName = mData.data.name;
    notifyListeners();
  }
}
