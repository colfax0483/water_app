
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:custom_chewie/custom_chewie.dart';

class RelateShow extends StatefulWidget {
  RelateShow({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<RelateShow> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    //_controller = VideoPlayerController.asset('assets/butterfly.mp4')
    _controller = VideoPlayerController.network("https://firebasestorage.googleapis.com/v0/b/logos-1ogo5.appspot.com/o/water.mp4?alt=media&token=504a23b8-b6b3-4016-896c-0be4b3c4dd06")
    ..initialize().then((_) {
      setState(() {
        _controller.play();
      });
    });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관련 영상'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: new Chewie(_controller,
          aspectRatio: 3 / 2, autoPlay: true, looping: false),
    );
  }
}
