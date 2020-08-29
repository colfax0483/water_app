import 'package:flutter/material.dart';
import 'package:navigation_state/page01_predict.dart';
import 'package:provider/provider.dart';

import 'page_login.dart';
import 'state_simple.dart';
import 'page0_intro.dart';
import 'exbath.dart';
import 'page3_exbath2.dart';
import 'page3_exbath3.dart';
import 'page4_exbath4.dart';
import 'page5_exbath5.dart';
import 'page6_kitchen.dart';
import 'page7_cloth.dart';
import 'page_summing_intro.dart';
import 'page_oneresult.dart';
import 'resultlist.dart';
import 'savewater.dart';



void main() => runApp(StateLoginDemo());

  var loginFormApp = ChangeNotifierProvider(
    create: (context) => SimpleState(),
    child: StateLoginDemo(),
  );

  const String ROOT_PAGE = '/';
  const String MAIN_PAGE = '/main';
  const String INTRO_PAGE = '/intro';
  const String LOGIN_PAGE = '/login';
  const String PREDICT_PAGE = '/predict';
  const String PAGE_1 = '/page1';
  const String PAGE_2 = '/page2';
  const String PAGE_3 = '/page3';
  const String PAGE_4 = '/page4';
  const String PAGE_5 = '/page5';
  const String PAGE_6 = '/page6';
  const String PAGE_7 = '/page7';
  const String PAGE_8 = '/page8';
  const String SUM_INTRO = '/summingpage';
  const String ONERESULT = '/oneresult';

  const String RESULT = '/listpage';
  const String SAVEWATER = '/savewater';



class StateLoginDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create :(context) => Counter()),
        ChangeNotifierProvider<SimpleState>(create : (context) => SimpleState()),
      ],
      child: MaterialApp(
        title: '물 사용량 측정 앱',
        debugShowCheckedModeBanner: false,
        initialRoute: ROOT_PAGE,
        routes: {
          ROOT_PAGE : (context) => Intro(),
          LOGIN_PAGE : (context) => LoginPage(),
          PREDICT_PAGE : (context) => SliderWidget(),
          PAGE_1: (context) => ExBath(),
          PAGE_2: (context) => ExBath2(),
          PAGE_3: (context) => ExBath3(),
          PAGE_4: (context) => ExBath4(),
          PAGE_5: (context) => ExBath5(),
          PAGE_6: (context) => Kitchen(),
          PAGE_7: (context) => Cloth(),
          SUM_INTRO: (context) => SummingIntro(),
          ONERESULT: (context) => OneResult(),
          RESULT: (context) => EventSummary(),
          SAVEWATER: (context) => SaveWater(),

        },
      ),
    );
  }
}