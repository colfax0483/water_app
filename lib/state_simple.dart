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
 // 절약하면 0, 절약안하면 1
  var _counter = {'predict':0, // 물 사용량 예상
    'people':0, //page 1
   'bath':0, 'shmin':0, 'savesh':0,// page2
   'teeth' : 0, 'teethcup':0, //page3
    'wash':0, 'washtime':0, 'savewash':0, //page4
    'toilet':0, 'savetoilet':0, //page5 변기가 몇 개 있나요? __여기까지 화장실
    'dish':0, 'dishmin' : 0, 'savedish' : 0, //설거지
    'washer': 0, 'savewasher' :0, //세탁
  };

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
