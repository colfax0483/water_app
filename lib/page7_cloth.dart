import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class Cloth extends StatefulWidget {
  Cloth({
    Key key,
  }) : super(key: key);

  @override
  _Cloth createState() => new _Cloth();
}

class _Cloth extends State<Cloth> {
  Map<int, bool> _pressed1 = {0: false, 1:false};
  Map<int, bool> _pressed2 = {0: false, 1:false};

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "세탁",
            style: TextStyle(fontFamily: 'BMDOHYEON'),
          )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/pic_wash.png',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "세탁기의 종류는 무엇인가요?",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton.extended(
                            heroTag: 1,
                            onPressed: (){
                            setState(() {
                              count.setCounter('washer', 0);
                              _pressed1[0] = true;
                              _pressed1[1] = false;
                            });
                            }, label: Text('드럼', style: TextStyle(fontFamily: 'BMJua', fontSize: 20, color: Colors.black)),
                          backgroundColor: _pressed1[0] ? Colors.grey : Colors.lightBlueAccent,),

                          SizedBox(
                            width: 40.0,
                          ),
                          new FloatingActionButton.extended(
                            heroTag: 2,
                            onPressed: () {
                              setState(() {
                                count.setCounter('washer', 1);
                                _pressed1[0] = false;
                                _pressed1[1] = true;
                              },);
                            }, label: Text('통돌이', style: TextStyle(fontFamily: 'BMJua', fontSize: 20, color: Colors.black)),
                            backgroundColor: _pressed1[1] ? Colors.grey : Colors.lightBlueAccent,
                          ),
                        ]),
                    SizedBox(height: 20.0),

                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "세탁하는 방법은 어떻게 되나요?",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                    ),
                    SizedBox(height: 10.0),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton.extended(
                            heroTag: 3,
                            onPressed: (){
                            setState(() {
                              count.setCounter('savewasher', 0);
                              _pressed2[0] = true;
                              _pressed2[1] = false;
                            });
                          }, label: Text('한번에 모아 빨기', style: TextStyle(fontFamily: 'BMJua', fontSize: 20, color: Colors.black)),
                            backgroundColor: _pressed2[0] ? Colors.grey : Colors.lightBlueAccent,),

                          SizedBox(
                            height: 20.0, width: 1000
                          ),
                          new FloatingActionButton.extended(
                            heroTag: 4,
                            onPressed: () {
                              setState(() {
                                count.setCounter('savewasher', 1);
                                _pressed2[0] = false;
                                _pressed2[1] = true;
                              },);
                            }, label: Text('그때그때 바로 빨기', style: TextStyle(fontFamily: 'BMJua', fontSize: 20, color: Colors.black)),
                            backgroundColor: _pressed2[1] ? Colors.grey : Colors.lightBlueAccent,
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
              SizedBox(height: 180,)
            ]
        ),
      ),
    );
  }
}