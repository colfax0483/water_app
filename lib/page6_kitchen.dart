import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';


class Kitchen extends StatefulWidget {
  Kitchen({
    Key key,
  }) : super(key: key);

  @override
  _Kitchen createState() => new _Kitchen();
}

class _Kitchen extends State<Kitchen> {
  Map<int, bool> _pressed = {0: false, 1:false, 2:false, 3:false};

  bool _isVisible = false;
  bool _pressedO = false;
  bool _pressedX = false;

  int resetter(int idx) {
    for (int i = 0; i < 5; i++) {
      if (i != idx) {
        _pressed[i] = false;
      }
    }
  }

  void showToast() {
    setState(() {
      _isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "부엌",
            style: TextStyle(fontFamily: 'BMDOHYEON'),
          )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child:



        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/pic_dish.png',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                child: Column(children: <Widget>[
                  SizedBox(height: 15.0,),
                  Text("설거지는 하루에 몇 번 하나요?", style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FloatingActionButton(
                        heroTag: 1,
                        child: new Icon(Icons.remove, color: Colors.black,),
                        onPressed: () {
                          count.decrement('dish');
                        },
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: 15.0),
                      new Text('${count.getCounter('dish')} 번',
                          style: new TextStyle(fontSize: 45.0)),
                      SizedBox(width: 15.0),
                      new FloatingActionButton(
                        heroTag: 2,
                        onPressed: () {
                          count.increment('dish');
                          showToast();
                        },
                        child: new Icon( Icons.add, color: Colors.black,),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                ]),
              ),

              AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Card(
                      child: Column(
                          children: <Widget>[
                            SizedBox(height: 15.0,),
                            Text("설거지를 몇 분 정도 하나요?", style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 120,
                                  child:new FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white)),
                                    child: new Text("5분 이하", style: TextStyle(
                                        fontFamily: 'BMJua', fontSize: 24)),
                                    onPressed: () {count.setCounter('dishmin', 1);setState(() {
                                      _pressed[0] = true ;
                                      resetter(0);
                                    });},
                                    padding: EdgeInsets.all(15.0),
                                    color: _pressed[0] ? Colors.blueGrey : Colors.blueAccent,
                                    textColor: Colors.white,
                                  ),
                                ),

                                SizedBox(width: 10.0),
                                SizedBox(
                                  width: 120,
                                  child: new FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white)),
                                    child: new Text("5 ~ 10분", style: TextStyle(
                                        fontFamily: 'BMJua', fontSize: 24)),
                                    onPressed: () {count.setCounter('dishmin', 2);setState(() {
                                      _pressed[1] = true ;
                                      resetter(1);
                                    });},
                                    padding: EdgeInsets.all(15.0),
                                    color: _pressed[1] ? Colors.blueGrey : Colors.blueAccent,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.white)),
                                  child: new Text("11 ~ 15분", style: TextStyle(
                                      fontFamily: 'BMJua', fontSize: 24)),
                                  onPressed: () {count.setCounter('dishmin', 3);setState(() {
                                    _pressed[2] = true ;
                                    resetter(2);
                                  });
                                  },
                                  padding: EdgeInsets.all(15.0),
                                  color: _pressed[2] ? Colors.blueGrey : Colors.blueAccent,
                                  textColor: Colors.white,
                                ),
                                SizedBox(width: 10.0),
                                SizedBox(
                                  width: 120,
                                  child: new FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white)),
                                    child: new Text("15분 이상", style: TextStyle(
                                        fontFamily: 'BMJua', fontSize: 24)),
                                    onPressed: () {count.setCounter('dishmin', 4);
                                    setState(() {
                                      _pressed[3] = true ;
                                      resetter(3);
                                    });},
                                    padding: EdgeInsets.all(15.0),
                                    color: _pressed[3] ? Colors.blueGrey : Colors.blueAccent,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0),
                          ]
                      )
                  )
              ),


              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height : 20.0,),
                      Text("설거지를 할 때 설거지통을 사용하나요?", style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),),
                      SizedBox(height: 10.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children : <Widget>[
                            new FloatingActionButton(
                              heroTag: 3,
                              child: new Icon(Icons.panorama_fish_eye,
                                color: Colors.blueAccent,),
                              onPressed: () {
                                setState(() {
                                  count.setCounter('savedish', 0);
                                  _pressedO = true;
                                  _pressedX = false;
                                });},
                              backgroundColor: _pressedO ? Colors.grey : Colors.white,
                            ),
                            SizedBox(width: 40.0,),
                            new FloatingActionButton(
                              heroTag: 4,
                              child: new Icon(Icons.close,
                                color: Colors.red,),
                              onPressed: () {
                                setState(() {
                                  count.setCounter('savedish',1);
                                  _pressedX = true;
                                  _pressedO = false;
                                });},
                              backgroundColor: _pressedX ? Colors.grey : Colors.white,
                            ),

                          ]
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),

                ),
              ),

              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: new FlatButton(
                    onPressed: () {
                      count.calcKitchen();
                      Navigator.pushNamed(context, PAGE_7);

                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('assets/btn_next.png',
                        width : 100, fit:BoxFit.cover)),
              ),
            ]
        ),
        ),
      ),
    );
  }
}
