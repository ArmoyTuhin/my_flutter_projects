import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier{
  int _counter = 0;
  String get counterValue => "currentValue: $_counter";

  /*void incrementCounter([void setState]){
    _counter++;
    print("current counter value = $_counter");
  }*/

  void incrementCounter(){
    _counter++;
    print("current counter value = $_counter");
    notifyListeners();
  }

  void decrementCounter(){
    _counter--;
    print("current counter value = $_counter");
    notifyListeners();
  }
}