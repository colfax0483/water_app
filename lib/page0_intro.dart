import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:animator/animator.dart';
import 'login_form_demo_v2.dart';

class Intro extends StatefulWidget {
  Intro({
    Key key,
  }) : super(key: key);

  @override
  _Intro createState() => new _Intro();
}

class _Intro extends State<Intro> {
  final AnimatorKey animatorKey = AnimatorKey<double>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Animator<double>(
                  duration: Duration(seconds: 2),
                  cycles: 0,
                  // animatorKey: animatorKey, 키 추가하면 트리거 설정 가
                  builder: (_, animatorState, __) => FadeTransition(
                        opacity: animatorState.animation,
                        child: new Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/pic_main.png',
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
              new OutlineButton(
                  child: new Text("START",
                      style: TextStyle(
                          fontFamily: "BMYEONSUNG",
                          fontSize: 30.0,
                          color: Colors.white)),
                  onPressed: () => Navigator.pushNamed(context, LOGIN_PAGE),
                  borderSide: BorderSide(color: Colors.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)))
            ]),
      ),
    );
  }
}
