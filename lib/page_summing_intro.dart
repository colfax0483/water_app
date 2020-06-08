import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:animator/animator.dart';
import 'state_simple.dart';
import 'login_form_demo_v2.dart';

class SummingIntro extends StatefulWidget {
  SummingIntro({
    Key key,
  }) : super(key: key);

  @override
  _SummingIntro createState() => new _SummingIntro();
}

class _SummingIntro extends State<SummingIntro> {
  final AnimatorKey animatorKey = AnimatorKey<double>();

  void _store(BuildContext context) async {
    final SimpleState state = Provider.of<SimpleState>(context, listen: false);
    final Counter count = Provider.of<Counter>(context, listen: false);
    Firestore.instance.collection('User').add({
      'Email': state.getEmail(),
      'Nick': state.getNick(),
      'bath': count.getCounter('bathresult'),
      'kitchen': count.getCounter('kitresult'),
      'cloth': count.getCounter('clothresult'),
      'water': count.getCounter('total'),
      'timestamp': DateTime.now()
      //Timestamp myTimeStamp = Timestamp.fromDate("가져온시간").toDate();
    });
  }

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
                              'assets/pic_summing.png',
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
              SizedBox(
                width: 350.0,
                child: TextLiquidFill(
                  waveColor: Colors.lightBlueAccent,
                  boxBackgroundColor: Colors.white70,

                  text: "당신이 오늘\n지구에게 대출받은\n물은 얼마일까요?",
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontFamily: "BMJua",
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 200.0,
                  // or Alignment.topLeft
                ),
              ),
              new OutlineButton(
                  child: new Text("결과 보기",
                      style: TextStyle(
                          fontFamily: "BMYEONSUNG",
                          fontSize: 30.0,
                          color: Colors.white)),
                  onPressed: () {
                    _store(context);
                    Navigator.pushNamed(context, ONERESULT);
                  },
                  borderSide: BorderSide(color: Colors.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)))
            ]),
      ),
    );
  }
}
