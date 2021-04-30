import 'package:flutter/cupertino.dart';

class letsIncrement extends ChangeNotifier{
  int value = 0;

  void increament() {
    value++;
    notifyListeners();
}



}