import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';


//ExBath4 = 화장실, 몇 번 세면하나요? 몇 분 정도 세면하나요? 비누칠을 위해 물을 끄나요?

class ExBath4 extends StatefulWidget {
  ExBath4({
    Key key,
  }) : super(key: key);

  @override
  _Exbath4 createState() => new _Exbath4();
}

class _Exbath4 extends State<ExBath4> {

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "화장실",
            style: TextStyle(fontFamily: 'BMDOHYEON'),
          )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          new Container(
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/pic_face.png',
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            child: Column(children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Text(
                "하루에 몇 번 세면하나요?",
                style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FloatingActionButton(
                    heroTag: 1,
                    child: new Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      count.decrement('washtime');
                    },
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 15.0),
                  new Text('${count.getCounter('washtime')} 번',
                      style: new TextStyle(fontFamily: 'BMJua', fontSize: 45.0)),
                  SizedBox(width: 15.0),
                  new FloatingActionButton(
                    heroTag: 2,
                    onPressed: () {
                      count.increment('washtime');
                    },
                    child: new Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
            ]),
          ),
          Card(
            child: Column(children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Text(
                "몇 분 정도 세면하나요?",
                style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FloatingActionButton(
                    heroTag: 3,
                    child: new Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      count.decrement('wash');
                    },
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 15.0),
                  new Text('${count.getCounter('wash')} 분',
                      style: new TextStyle(fontFamily: 'BMJua', fontSize: 45.0)),
                  SizedBox(width: 15.0),
                  new FloatingActionButton(
                    heroTag: 4,
                    onPressed: () {
                      count.increment('wash');
                    },
                    child: new Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
            ]),
          ),


          new FlatButton(
              onPressed: () => Navigator.pushNamed(context, PAGE_5),
              padding: EdgeInsets.all(0.0),
              child: Image.asset('assets/btn_next.png',
                  width: 100, fit: BoxFit.cover)),
          SizedBox(height: 90.0)
        ]),
      ),
    );
  }
}


/*
물을 잠구고 씻을 때 절약 삭제.

          Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "세면 중간 비누칠을 하기 위해 물을 끄나요?",
                  style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FloatingActionButton(
                        heroTag: 5,
                        child: new Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            count.setCounter("savewash", 0);
                            _pressedO = true;
                            _pressedX = false;
                          });
                        },
                        backgroundColor: _pressedO ? Colors.grey : Colors.white,
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      new FloatingActionButton(
                        heroTag: 6,
                        child: new Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            count.setCounter("savewash", 1);
                            _pressedX = true;
                            _pressedO = false;
                          });
                        },
                        backgroundColor: _pressedX ? Colors.grey : Colors.white,
                      ),
                    ]),
                SizedBox(height: 20.0),
              ],
            ),
          ),
 */