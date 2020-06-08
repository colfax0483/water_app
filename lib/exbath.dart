import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class ExBath extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(title: Text("집에 몇 명이 살고 있나요?", style: TextStyle(
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
                        onPressed: () => Navigator.pushNamed(context, PAGE_2),
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