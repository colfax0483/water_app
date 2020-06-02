import 'package:flutter/material.dart';
import 'custom_slider_thumb_circle.dart';
import 'login_form_demo_v2.dart';

import 'package:provider/provider.dart';
import 'state_simple.dart';

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  SliderWidget(
      {this.sliderHeight = 48,
      this.max = 300,
      this.min = 0,
      this.fullWidth = false});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;
  int _pval = 0;

  @override
  Widget build(BuildContext context) {
    Counter count = Provider.of<Counter>(context);
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "물 사용량 예상하기",
        style: TextStyle(fontFamily: 'BMDOHYEON'),
      )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        "하루에 몇 L의 물을 사용하는 것 같습니까?",
                        style: TextStyle(fontFamily: "BMDOHYEON", fontSize: 20)
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      width: this.widget.fullWidth
                          ? double.infinity
                          : (this.widget.sliderHeight) * 5.5,
                      height: (this.widget.sliderHeight),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular((this.widget.sliderHeight * .3)),),
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF00c6ff),
                              const Color(0xFF0072ff),
                            ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.00),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        this.widget.sliderHeight * paddingFactor,
                        2,
                        this.widget.sliderHeight * paddingFactor,
                        2),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '${this.widget.min}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: this.widget.sliderHeight * .3,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: this.widget.sliderHeight * .1,
                        ),
                        Expanded(
                          child: Center(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white.withOpacity(1),
                                inactiveTrackColor:
                                    Colors.white.withOpacity(.5),

                                trackHeight: 4.0,
                                thumbShape: CustomSliderThumbCircle(
                                  thumbRadius: this.widget.sliderHeight * .4,
                                  min: this.widget.min,
                                  max: this.widget.max,
                                ),
                                overlayColor: Colors.white.withOpacity(.4),
                                //valueIndicatorColor: Colors.white,
                                activeTickMarkColor: Colors.white,
                                inactiveTickMarkColor:
                                    Colors.red.withOpacity(.7),
                              ),
                              child: Slider(
                                  value: _value,
                                  divisions:10,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                      _pval =
                                          ((this.widget.max * _value).round());
                                    });
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: this.widget.sliderHeight * .1,
                        ),
                        Text(
                          '${this.widget.max}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: this.widget.sliderHeight * .3,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('${_pval} L', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,),),
                    SizedBox(height: 10.0),
                    new FlatButton(
                    onPressed: () => Navigator.pushNamed(context, PAGE_1),
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('assets/btn_next.png',
                        width: 100, fit: BoxFit.cover)),
                SizedBox(height: 20.0)
              ],
            )),
          ],
        ),
      ),
    );
  }
}
