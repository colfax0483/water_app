import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

//하루에 몇 번 이를 닦나요?

class ExBath3 extends StatefulWidget {
  ExBath3({
    Key key,
  }) : super(key: key);

  @override
  _Exbath3 createState() => new _Exbath3();
}

class _Exbath3 extends State<ExBath3> {
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
                'assets/pic_teeth.png',
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
                "하루에 몇 번 이를 닦나요?",
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
                      count.decrement('teeth');
                    },
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 15.0),
                  new Text('${count.getCounter('teeth')} 번',
                      style:
                      new TextStyle(fontFamily: 'BMJua', fontSize: 45.0)),
                  SizedBox(width: 15.0),
                  new FloatingActionButton(
                    heroTag: 2,
                    onPressed: () {
                      count.increment('teeth');
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
                  "이를 닦을 때 컵에 물을 받아 사용하나요?",
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
                            _pressedO = true;
                            _pressedX = false;
                            count.setCounter('teethcup', 0);
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
                            _pressedX = true;
                            _pressedO = false;
                            count.setCounter('teethcup', 1);
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
              onPressed: () => Navigator.pushNamed(context, PAGE_4),
              padding: EdgeInsets.all(0.0),
              child: Image.asset('assets/btn_next.png',
                  width: 100, fit: BoxFit.cover)),
          SizedBox(height: 180.0)
        ]),
      ),
    );
  }
}
