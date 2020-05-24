import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class ExBath extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);
    SimpleState user = Provider.of<SimpleState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("몇 명이 사용하나요?", style: TextStyle(
        fontFamily: 'BMDOHYEON'),
      )),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FloatingActionButton(
                      heroTag: 1,
                      child: new Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                      onPressed: () {count.decrement('people');},
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 15.0),
                    new Text('${count.getCounter('people')} 명',
                        style: new TextStyle(fontSize: 45.0)),
                    SizedBox(width: 15.0),
                    new FloatingActionButton(
                      heroTag: 2,
                      onPressed: () {count.increment('people');},
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    new FlatButton(
                        onPressed: () => Navigator.pushNamed(context, PAGE_3),
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset('assets/btn_next.png',
                        width : 100, fit:BoxFit.cover)),
                  ],
                ),
              ],

            ),
          )
      ),
    );
  }
}


class ExBath2 extends StatefulWidget{
  ExBath2({Key key,}): super(key:key);

  @override
  _Exbath2 createState() => new _Exbath2();

}

class _Exbath2 extends State<ExBath2> {
  Map<int, bool> pressed = {0: false, 1:false, 2:false, 3:false};

  int resetter (int idx){
   for (int i =0; i<5; i++){
        if(i!=idx){
          pressed[i] = false;
        }
   }
  }

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(title: Text("하루에 몇 분동안 샤워하나요?", style: TextStyle(
        fontFamily: 'BMDOHYEON'),
      )),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children:<Widget>[
                    new Container(
                      child: new Image.asset('assets/pic_bath.png', height: 180,
                      fit: BoxFit.cover,),
                    ),

                  ],

                ),
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
                        onPressed: () {count.setCounter('long', 1);setState(() {
                          pressed[0] = true ;
                          resetter(0);
                        });},
                        padding: EdgeInsets.all(15.0),
                        color: pressed[0] ? Colors.blueGrey : Colors.blueAccent,
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
                        onPressed: () {count.setCounter('long', 2);setState(() {
                          pressed[1] = true ;
                          resetter(1);
                        });},
                        padding: EdgeInsets.all(15.0),
                        color: pressed[1] ? Colors.blueGrey : Colors.blueAccent,
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
                      onPressed: () {count.setCounter('long', 3);setState(() {
                        pressed[2] = true ;
                        resetter(2);
                      });
                      },
                      padding: EdgeInsets.all(15.0),
                      color: pressed[2] ? Colors.blueGrey : Colors.blueAccent,
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
                        onPressed: () {count.setCounter('long', 4);
                        setState(() {
                          pressed[3] = true ;
                          resetter(3);
                        });},
                        padding: EdgeInsets.all(15.0),
                        color: pressed[3] ? Colors.blueGrey : Colors.blueAccent,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.announcement),
                        SizedBox(width: 10),
                        Flexible(
                          child:
                          new Text("알고 있나요? 10분 동안 샤워를 하면 100 리터 이상의 물을 사용하게 됩니다."
                              "두 곡의 노래가 재생되는 데 걸리는 시간 동안만 샤워를 할 수 있도록 도전해 봐요!",
                          style: TextStyle(
                            fontFamily: 'BMJua',
                            fontStyle: FontStyle.normal,
                            fontSize: 16
                          ),),
                        ),

                      ]
                    ),
                    SizedBox(height: 15.0),

                    new FlatButton(
                        onPressed: () => Navigator.pushNamed(context, PAGE_3),
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset('assets/btn_next.png',
                            width : 100, fit:BoxFit.cover)),
                  ],
                ),
              ],

            ),
          )
      ),
    );
  }
}