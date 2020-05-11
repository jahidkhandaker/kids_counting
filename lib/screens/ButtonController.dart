import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonControllerState();
  }
}

class ButtonControllerState extends State<ButtonController>
    with TickerProviderStateMixin {
  AnimationController _controller;

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 1.2,
  );


  bool _first = true;
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            getA(),
            getA(),
          ],
        ),
      ],
    );
  }

  getA() {

    return RotationTransition(
      turns: turnsTween.animate(_controller),
      child: Container(
        child: Container(
          width: 200,
          height: 200,
          padding: EdgeInsets.all(20),
          child: FlatButton(
            color: Colors.white,
            onPressed: () {
              if (_first) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              _first = !_first;
            },
            child: Image.asset('assets/images/number-1.png'),
          ),
        ),
      ),
    );
  }
}
