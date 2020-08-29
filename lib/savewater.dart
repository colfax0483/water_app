import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'videoplayer.dart';
import 'package:firebase_admob/firebase_admob.dart';

class SaveWater extends StatefulWidget{
  @override
  _SaveWaterPageState createState() => _SaveWaterPageState();

}

class _SaveWaterPageState extends State<SaveWater>
{
  final textstyle = TextStyle(
      fontFamily: 'BMJua',
      fontSize: 45.0,
      color: Colors.white,
      backgroundColor: Colors.black38);

  BannerAd myBanner;

  BannerAd buildBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-4694527876945328~9557231839',
      size: AdSize.banner,
      listener: (MobileAdEvent event){
        if(event == MobileAdEvent.loaded){
          myBanner..show();
        }
      }
    );
  }

  @override
  void initState(){
    super.initState();

    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-4694527876945328~9557231839');
    myBanner = buildBannerAd()..load();
  }

  @override
  void dispose(){
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "어떻게 물을 절약할까요?",
            style: TextStyle(fontFamily: 'BMDOHYEON'),
          )),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Hero(
              tag: 'imageHero',
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return DetailScreen();
                                  }));
                            },
                            splashColor: Theme
                                .of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Ink.image(
                                          image: AssetImage(
                                              "assets/pic_resultBath.png"),
                                          fit: BoxFit.cover,
                                          child: Container(),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: -10,
                                          left: 16,
                                          right: 16,
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child: Text("화장실",
                                                  style: textstyle)))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return DetailKitchen();
                                  }));
                            },
                            splashColor: Theme
                                .of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Ink.image(
                                          image: AssetImage(
                                              "assets/pic_resultKitchen.png"),
                                          fit: BoxFit.cover,
                                          child: Container(),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: -40,
                                          left: 16,
                                          right: 16,
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child:
                                              Text("부엌", style: textstyle)))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return DetailLaundry();
                                  }));
                            },
                            splashColor: Theme
                                .of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Ink.image(
                                          image: AssetImage(
                                              "assets/pic_resultLaundry.png"),
                                          fit: BoxFit.cover,
                                          child: Container(),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: -30,
                                          left: 16,
                                          right: 16,
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child:
                                              Text("세탁", style: textstyle)))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return RelateShow();
                                  }));
                            },
                            splashColor: Theme
                                .of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Ink.image(
                                          image: AssetImage(
                                              "assets/pic_relateshow.png"),
                                          fit: BoxFit.cover,
                                          child: Container(),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 16,
                                          left: 16,
                                          right: 16,
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child:
                                              Text("관련영상", style: textstyle)))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(

        child:


      Column(
        children: [
          SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                child: Center(
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.asset("assets/pic_resultBath.png"),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      "변기 수조를 절수형으로 설치하여 50% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "기존 변기수조에 절수기 설치 또는 물 채운 병을 넣어 20% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                  ],
                )),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/pic_res5.png',
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/pic_res7.png',
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      ),
    );
  }
}

class DetailKitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                child: Center(
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.asset("assets/pic_resultKitchen.png"),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      "설거지통 이용으로 60% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "수도꼭지에 물 조리개를 부착하여 20% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                  ],
                )),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/pic_res6.png',
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class DetailLaundry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                child: Center(
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.asset("assets/pic_resultLaundry.png"),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      "빨래감은 한 번에 모아 빨아서 30% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "세탁기는 알맞은 용량, 수위는 알맞게 조절하여 50% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                    Text(
                      "헹굼은 적정횟수, 마지막 헹굼은 재이용으로 50% 절수",
                      style: TextStyle(fontFamily: 'BMDOHYEON', fontSize: 18),
                    ),
                  ],
                )),
          ),
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/pic_res4.png',
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}



