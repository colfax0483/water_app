import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color postitiveColor = new Color(0xFF70C8FF);
  Color negetiveColor = new Color(0xFFFFFFFF);
  double percentage = 0.0;

  double initial = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "물 사용량 예상해 보기",
            style: TextStyle(fontFamily: 'BMDOHYEON'),
          )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              (200 - percentage).round().toString() + ' L',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60.0,
                color: postitiveColor,
              ),
            ),
            GestureDetector(
              onPanStart: (DragStartDetails details) {
                initial = details.globalPosition.dy;
              },
              onPanUpdate: (DragUpdateDetails details) {
                double distance = details.globalPosition.dy - initial;
                double percentageAddition = distance / 200;
                // print('distance ' + distance.toString());
                setState(() {
                  print('percentage ' +
                      (percentage + percentageAddition)
                          .clamp(0.0, 200.0)
                          .toString());
                  percentage =
                      (percentage + percentageAddition).clamp(0.0, 200.0);
                });
              },
              onPanEnd: (DragEndDetails details) {
                initial = 0.0;
              },
              child: CustomSlider(
                percentage: this.percentage,
                positiveColor: postitiveColor,
                negativeColor: negetiveColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  double totalWidth = 400.0;
  double percentage;
  Color positiveColor;
  Color negativeColor;

  CustomSlider({this.percentage, this.positiveColor, this.negativeColor});

  @override
  Widget build(BuildContext context) {
    // print((percentage / 200) * totalWidth);
    // print((1 - percentage / 200) * totalWidth);
    return Container(
      height: totalWidth + 4.0,
      width: 200.0,
      decoration: BoxDecoration(
          color: positiveColor,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: negativeColor,
            height: (percentage / 200) * totalWidth,
          ),
        ],
      ),
    );
  }
}
