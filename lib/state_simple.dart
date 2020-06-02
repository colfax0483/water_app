import 'package:flutter/material.dart';

import 'dart:math';

class SimpleState extends ChangeNotifier {
  // String _email = "null";
  var _account = {'email': 'null', 'nick': 'null'};

  void setAccount(String e, String n) {
    _account['email'] = e;
    _account['nick'] = n;
    notifyListeners();
  }

  getAccount() => _account['nick'];
}

class Counter with ChangeNotifier {
  // 절약하면 0, 절약안하면 1
  var _counter = {
    'predict': 210, // 물 사용량 예상
    'people': 3, //page 1
    'bath': 0, 'shmin': 0, 'savesh': 0, // page2
    'teeth': 0, 'teethcup': 0, //page3
    'wash': 0, 'washtime': 0, 'savewash': 0, //page4
    'toilet': 0, 'savetoilet': 0, //page5 변기가 몇 개 있나요? __여기까지 화장실
    'dish': 0, 'dishmin': 0, 'savedish': 0, //설거지
    'washer': 0, 'savewasher': 0, //세탁
    'bathresult': 116, 'kitresult' : 80, "clothresult" : 102, 'total': 0 //결과저장
  };

  getCounter(String obj) => _counter[obj];

  setCounter(String obj, int counter) => _counter[obj] = counter;

  void increment(String obj) {
    _counter[obj]++;
    notifyListeners();
  }

  void decrement(String obj) {
    if (_counter[obj] > 1) {
      _counter[obj]--;
      notifyListeners();
    }
  }
  void calcCloth() {
    double cloth = 0;
    int time = _counter['savewasher'];

    //주 3회 이상
    if (time >= 3) {
      //통돌이
      if(_counter['washer'] == 1) { cloth = 100 * time.toDouble() ;}
      //드럼
      else if(_counter['washer'] == 0) { cloth = 50 * time.toDouble() ;}
    }
    //주 3회 미만
    else if(time < 3){
      if(_counter['washer'] == 1) { cloth = 150 * time.toDouble() ;}
      //드럼
      else if(_counter['washer'] == 0) { cloth = 100 * time.toDouble() ;}
    }

    if(_counter['people'] > 1) { cloth = cloth * pow(0.88, _counter['people']);}
    _counter['clothresult'] = cloth.toInt();
    print('세탁 사용량 : ${_counter['clothresult']} L');

    _counter['total'] = _counter['clothresult'] + _counter['kitresult'] +
        _counter['bathresult'];

    notifyListeners();
  }

  void calcKitchen() {
    double dish = 0;

    if (_counter['savedish']==0) { dish = _counter['dish'].toDouble() * 20; }
    if (_counter['savedish']==1) { dish = _counter['dish'].toDouble() * 40; }

    if(_counter['people'] > 1){ dish = dish * pow(0.88, _counter['people'] ); }//사람 1명당 12% 감소}

    _counter['kitresult'] = dish.toInt();
    print('부엌 사용량 : ${_counter['kitresult']} L');
    notifyListeners();

  }
  void calcBath() {
    double shmin = 0;
    double teeth = 0;
    double wash = 0;
    double toilet = 0;
    double result = 0;

    if (_counter['bath'] != 0) {
      switch (_counter['shmin']) {
        case 1:
          {
            //5분 이내 샤워시 15L 사용
            shmin = 15;
            break;
          }
        case 2:
          {
            //5~10분 샤워시 30L 사용
            shmin = 30;
            break;
          }
        case 3:
          {
            shmin = 45;
            break;
          }
        case 4:
          {
            shmin = 60;
            break;
          }
      }
      if (_counter['savesh'] == 0) {
        shmin = shmin * 0.3;
      } //절수형 샤워기 사용시 절약
      shmin = shmin * _counter['bath']; //하루에 몇 번 샤워하는지 곱하기
    }
    if (_counter['teethcup'] == 0) {
      teeth = _counter['teeth'].toDouble() * 9 * 0.3;
    }
    if (_counter['teethcup'] == 1) {
      teeth = _counter['teeth'].toDouble() * 9;
    }

    wash = _counter['wash'].toDouble() * _counter['washtime'] * 3;

    if (_counter['savetoilet'] == 0) {
      toilet = _counter['toilet'].toDouble() * 25;
    }
    if (_counter['savetoilet'] == 1) {
      toilet = _counter['toilet'].toDouble() * 45;
    }

    result = shmin + teeth + wash + toilet;
    _counter['bathresult'] = result.toInt();
    print('화장실 사용량 : ${_counter['bathresult']} L');
    notifyListeners();
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
