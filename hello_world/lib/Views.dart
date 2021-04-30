import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NormalRaisedButton(VoidCallback callBack, String btnName, {Color mColor} ) {
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      side: BorderSide(color: Colors.black12),
    ),
    color: mColor ?? Colors.white12,
    onPressed: () => callBack,
    child: Text(btnName),
    textColor: Colors.black,
  );
}
