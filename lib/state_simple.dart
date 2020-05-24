import 'package:flutter/material.dart';

class SimpleState extends ChangeNotifier {
  // String _email = "null";
  var  _account = {'email':'null', 'nick':'null'};

  void setAccount(String e, String n) {
    _account['email'] = e;
    _account['nick'] = n;
    notifyListeners();
  }
  getAccount() => _account['nick'];
}

class Counter with ChangeNotifier{

  var _counter = {'people':0, 'bath':0};

  getCounter(String obj) => _counter[obj];
  setCounter(String obj, int counter) => _counter[obj] = counter;

  void increment(String obj){
    _counter[obj]++;
    notifyListeners();
  }
  void decrement(String obj){
    if (_counter[obj]>1) {
      _counter[obj]--;
      notifyListeners();
    }

  }
}


/*
class Counter with ChangeNotifier{
  int _counter = 1;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment(){
    _counter++;
    notifyListeners();
  }
  void decrement(){
    if (_counter>1) {
      _counter--;
      notifyListeners();
    }

  }
}*/
