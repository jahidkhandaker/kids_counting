import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'audioController.dart';

class CountingObject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CountingObjectState();
  }
}

class CountingObjectState extends State<CountingObject> {
  var appleNo = 1;
  String soundBtn = 'btn-mute';
  audioController ac = audioController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/number_counting_bg.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, true),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 2),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Image.asset('assets/images/object-$appleNo.png'),
                ),
                Spacer(flex: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getButton(1),
                    getButton(4),
                    getButton(7),
                    getButton(10),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getButton(2),
                    getButton(5),
                    getButton(8),
                    getMuteButton(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getButton(3),
                    getButton(6),
                    getButton(9),
                    getLoopButton(),
                    //getIconButton('sound-loop'),
                  ],
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
        //child: ,
      ),
    );
  }

  getButton(var n) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: IconButton(
        icon: Image.asset('assets/images/number-$n.png'),
        iconSize: 50,
        onPressed: () {
          ac.audioPlay(n);
          setState(() {
            appleNo = n;
          });
        },
      ),
    );
  }

  getMuteButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: IconButton(
        icon: Image.asset('assets/images/$soundBtn.png'),
        iconSize: 50,
        onPressed: () {
          ac.player.setVolume(0.0);
          setState(() {
            if (soundBtn == 'btn-mute')
              soundBtn = 'btn-unmute';
            else
              soundBtn = 'btn-mute';
          });
        },
      ),
    );
  }

  getLoopButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: IconButton(
        icon: Image.asset('assets/images/btn-repeat.png'),
        iconSize: 50,
        onPressed: () {
          allPlay(1);
        },
      ),
    );
  }

  allPlay(var i) {
    ac.player.play(ac.mp3dir[i]);
    ac.player.onPlayerCompletion.listen((event) {
      if (i < 10) {
        ac.player.play(ac.mp3dir[++i]);
        setState(() {
          appleNo = i;
        });
      } else
        ac.player.stop();
    });
  }

  void route() {
    Navigator.pop(context, true);
  }
}
