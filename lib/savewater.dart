import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:youtube_player/youtube_player.dart';

import 'dart:async';

enum CardType {
  standard,
  tappable,
  selectable,
}

class Place {
  final String assetName;
  final String title;
  final String description;

  const Place({
    @required this.assetName,
    @required this.title,
    @required this.description,
  });
}

List<Place> place(BuildContext context) =>
    [
      Place(
          assetName: "assets/pic_resultBath.png",
          title: "화장실",
          description: "변기수조를 절수형으로 설치하여 50% 절수"),
    ];

class SaveWater extends StatelessWidget {
  static const height = 338.0;

  final textstyle = TextStyle(
      fontFamily: 'BMJua',
      fontSize: 45.0,
      color: Colors.white,
      backgroundColor: Colors.black38);

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

class RelateShow extends StatefulWidget {
  RelateShow({Key key}) : super(key: key);




  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<RelateShow> {
  static const platform = const MethodChannel("np.com.sarbagyastha.example");
  TextEditingController _idController = TextEditingController();
  TextEditingController _seekToController = TextEditingController();
  double _volume = 1.0;
  VideoPlayerController _videoController;
  String position = "Get Current Position";
  String status = "Get Player Status";
  String videoDuration = "Get Video Duration";
  String _source = "7QUtEmBT_-w";
  bool isMute = false;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    getSharedVideoUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('관련영상'),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                YoutubePlayer(
                  context: context,
                  source: _source,
                  quality: YoutubeQuality.HD,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  loop: false,
                  reactToOrientationChange: true,
                  startFullScreen: false,
                  controlsActiveBackgroundOverlay: true,
                  controlsTimeOut: Duration(seconds: 4),
                  playerMode: YoutubePlayerMode.DEFAULT,
                  callbackController: (controller) {
                    _videoController = controller;
                  },
                  onError: (error) {
                    print(error);
                  },
                  onVideoEnded: () => _showThankYouDialog(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      TextFormField(
                      controller: _idController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter youtube",
                  ),
                ),
              ]
          ),)
        ,
        ]

    )), // 이 마지막 콤마는 build 메서드에 자동 서식이 잘 적용될 수 있도록 도와줍니다.
    );
  }
  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Video Ended"),
          content: Text("Thank you for trying the plugin!"),
        );
      },
    );
  }
  getSharedVideoUrl() async {
    try {
      var sharedData = await platform.invokeMethod("getSharedYoutubeVideoUrl");
      if (sharedData != null && mounted) {
        setState(() {
          _source = sharedData;
          print(_source);
        });
      }
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}