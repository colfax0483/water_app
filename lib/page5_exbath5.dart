import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class ExBath5 extends StatefulWidget {
  ExBath5({
    Key key,
  }) : super(key: key);

  @override
  _Exbath5 createState() => new _Exbath5();
}

class _Exbath5 extends State<ExBath5> {
  bool _pressedO = false;
  bool _pressedX = false;

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
                'assets/pic_rest1.png',
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
                "집에 변기가 몇 개 있나요?",
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
                      count.decrement('toilet');
                    },
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 15.0),
                  new Text('${count.getCounter('toilet')} 번',
                      style: new TextStyle(fontFamily: 'BMJua', fontSize: 45.0)),
                  SizedBox(width: 15.0),
                  new FloatingActionButton(
                    heroTag: 2,
                    onPressed: () {
                      count.increment('toilet');
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
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "절수형 변기를 사용하나요?",
                  style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FloatingActionButton(
                        heroTag: 3,
                        child: new Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            count.setCounter('savetoilet', 0);
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
                        heroTag: 4,
                        child: new Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            count.setCounter('savetoilet', 1);
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
          new FlatButton(
              onPressed: () {
                count.calcBath();
                Navigator.pushNamed(context, PAGE_6);

              },
              padding: EdgeInsets.all(0.0),
              child: Image.asset('assets/btn_next.png',
                  width: 100, fit: BoxFit.cover)),
          SizedBox(height: 180.0)
        ]),
      ),
    );
  }
}
