import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidscounting/screens/audioController.dart';

class CountingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountingPageState();
  }
}

class CountingPageState extends State<CountingPage>
    with TickerProviderStateMixin {

  audioController ac = audioController();


  AnimationController _breathingController;
  AnimationController _pulseController;
  Animation<double> _pulseAnimation;
  AnimationController _rotationController;
  Animation<double> _rotation;

  var _breathe = 0.0;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _pulseAnimation = Tween<double>(begin: 0.9, end:1.05).animate(
        CurvedAnimation(parent: _pulseController, curve: Curves.easeIn));

    _pulseAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _pulseController.reverse();
      else if (status == AnimationStatus.dismissed)
        _pulseController.forward();
    });
    _pulseController.forward();

    _rotationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _rotation =
        Tween<double>(begin: 0.0, end: 0.2).animate(_rotationController);

    _rotation.addStatusListener((status) {
      if (status == AnimationStatus.completed) _rotationController.reverse();
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/number_counting_bg.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context, true),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                        child: getTitleImage('number_counting_title'),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      getButton(1),
                      getButton(2),
                      getButton(3),
                      getButton(4),
                      getButton(5),

                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      getButton(6),
                      getButton(7),
                      getButton(8),
                      getButton(9),
                      getButton(10),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: getTitleImage('number_counting_clickToPlay'),
                  ),
                ),
              ],
            )));
  }

  getButton(var n) {

    return Padding(
      padding: EdgeInsets.all(10),
      child: ScaleTransition(
        scale: _pulseAnimation,
        child: Container(
          width: 60,
          height: 60,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pinkAccent,
            child: RotationTransition(
              turns: _rotation,
              child: GestureDetector(
                onTap: () {
                  _rotationController.forward();
                  ac.audioPlay(n);
                },
                child: Image.asset('assets/images/number-$n.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getTitleImage(String name) {
    AssetImage assetImage = AssetImage('assets/images/$name.png');
    Image image = Image(image: assetImage, width: 200.0, height: 100.0);
    return Container(child: image);
  }
}
