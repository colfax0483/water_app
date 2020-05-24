import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_login.dart';
import 'state_simple.dart';
import 'exbath.dart';
import 'page3_exbath2.dart';
import 'resultlist.dart';

void main() => runApp(StateLoginDemo());

var loginFormApp = ChangeNotifierProvider(
  create: (context) => SimpleState(),
  child: StateLoginDemo(),
);

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';
const String PAGE_2 = '/page2';
const String PAGE_3 = '/page3';
const String RESULT = '/listpage';


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
          ROOT_PAGE : (context) => EventSummary(),
          // ROOT_PAGE : (context) => LoginPage(),
          // ROOT_PAGE : (context) => ExBath2(),
          PAGE_2: (context) => ExBath(),
          PAGE_3: (context) => ExBath2(),
      },
      ),
    );
  }
}