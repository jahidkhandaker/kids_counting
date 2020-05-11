import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidscounting/screens/ButtonController.dart';
import 'CountingObject.dart';
import 'CountingPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
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
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: 250,
                height: 100,
                child: Image.asset('assets/images/number-title.png'),
              ),
            ),
            //getTitleImage('assets/images/number_title.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/images/number-btn-counting.png'),
                  iconSize: 120,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CountingPage();
                    }));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/number-btn-pic.png'),
                  iconSize: 120,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CountingObject();
                    }));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/number-btn-puzzle.png'),
                  iconSize: 120,
                  onPressed: () {
                    setState(() {
                      //angle = 45 / 360 * 2 * pi;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ButtonController();
                        }));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitleImage(String name) {
    AssetImage assetImage = AssetImage('assets/images/$name.png');
    Image image = Image(image: assetImage, width: 150.0, height: 150.0);
    return Container(child: image);
  }
}
