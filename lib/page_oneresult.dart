import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dart:math';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class WaterStat {
  final String locate;
  final double count;
  final charts.Color barColor;

  WaterStat({
    @required this.locate,
    @required this.count,
    @required this.barColor,
  });
}

class OneResult extends StatefulWidget {
  OneResult({
    Key key,
  }) : super(key: key);

  @override
  _OneResult createState() => new _OneResult();
}

class _OneResult extends State<OneResult> {
  List<WaterStat> data = [];
  List<WaterStat> data2 = [];

  @override
  void initState() {
    super.initState();

    data = [
      WaterStat(
        locate: '화장실',
        count: 93.0,
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      WaterStat(
        locate: '부엌',
        count: 35.0,
        barColor: charts.ColorUtil.fromDartColor(Colors.green),
      ),
      WaterStat(
        locate: '세탁',
        count: 36.0,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];


  }

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);

    data2 = [
      WaterStat(
          locate: '화장실',
          count: count.getCounter('bathresult').toDouble(),
          barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    WaterStat(
      locate: '부엌',
      count: count.getCounter('kitresult').toDouble(),
        barColor: charts.ColorUtil.fromDartColor(Colors.green),
      ),
      WaterStat(
        locate: '세탁',
        count: count.getCounter('clothresult').toDouble(),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(
          "오늘의 물 사용량",
          style: TextStyle(fontFamily: 'BMDOHYEON'),
        )),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg_main.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Card(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                        width: 500,
                      ),
                      Text(
                        "당신이 예상한 물 사용량은 ... ${count.getCounter("predict")} L",
                        style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                new Card(
                  child: Column(children: <Widget>[
                    SizedBox(height:10.0),
                    Text(
                      "실제 물 사용량",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        child: MyBarChart(data2),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text('총 사용량 : ${count.getCounter('total')} L'
                              , textAlign: TextAlign.center),
                        ))
                  ]),
                ),



                SizedBox(height: 10.0),
                new Card(
                  child: Column(children: <Widget>[
                    SizedBox(height:10.0),
                    Text(
                      "우리나라 평균 물 사용",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 20),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        child: MyBarChart(data),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text('총 사용량 : 180 L', textAlign: TextAlign.center),
                        ))
                  ]),
                ),
              ],
            )));
  }
}

class MyBarChart extends StatelessWidget {
  final List<WaterStat> data;

  MyBarChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WaterStat, String>> series = [
      charts.Series(
          id: 'WaterStat',
          data: data,
          domainFn: (WaterStat downloads, _) => downloads.locate,
          measureFn: (WaterStat downloads, _) => downloads.count,
          colorFn: (WaterStat downloads, _) => downloads.barColor)
    ];

    return charts.BarChart(
      series,
      animate: true,
      barGroupingType: charts.BarGroupingType.groupedStacked,
    );
  }
}
