import 'package:flutter/material.dart';

class Root extends ChangeNotifier{

int value = 0;
crease()
{
  value++;
  notifyListeners();
}

}