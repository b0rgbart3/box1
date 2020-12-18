// import Google's Material Design library
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;
import 'package:box1/pages/game.dart';
import 'package:box1/util/hexfunctions.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

const color0 = "#63d5ff";
const colors = ["#336cb3", "#34b7e8", "#44b7e8", "#54b7e8"];

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.black,
        child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 150),
            child: Column(children: [titleText(), cross()])));
  }

  Widget titleText() {
    return Text(
      "LIGHTBURST",
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: HexColor("#f2f2f2"),
        decoration: TextDecoration.none,
        fontFamily: 'Heebo',
      ),
    );
  }

  Widget cross() {
    return Column(
      children: [
        Tile(false, "", false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tile(false, "", false),
            Tile(false, "Play", true),
            Tile(false, "", false)
          ],
        ),
        Tile(false, "", false)
      ],
    );
  }
}

class Box extends StatefulWidget {
  Box(this.boxSize, this.light, this.boxColor, this.highlighted);
  double boxSize;
  bool light;
  String boxColor;
  bool highlighted;
  @override
  State<StatefulWidget> createState() =>
      _BoxState(boxSize, light, boxColor, highlighted);
}

class _BoxState extends State<Box> {
  _BoxState(this.boxSize, this.light, this.boxColor, this.highlighted);
  double boxSize;
  bool light;
  String boxColor;
  bool highlighted;
  double boxSpreadRadius = 10.0;
  Color mainColor;
  Color glowColor;

  @override
  Widget build(BuildContext context) {
    Color mainColor = HexColor(boxColor);
    Color glowColor = darkerHex(boxColor);

    if (light) {
      boxSpreadRadius = 6.0;
      glowColor = mainColor;
    }
    return TweenAnimationBuilder( 
      tween: Tween<double>(begin: 0, end: boxSize),
      duration: Duration(seconds: 2),
      builder: (BuildContext context, double size, Widget child) {
        return Container(
        width: boxSize,
        height: boxSize,
        child: Center(
            child: Container(
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: mainColor,
            boxShadow: [
              BoxShadow(
                  color: glowColor,
                  blurRadius: 10,
                  spreadRadius: boxSpreadRadius),
            ],
          ),
        )));
        }

    );
  }
}

class Tile extends StatefulWidget {
  Tile(this.highlighted, this.myString, this.touchable);
  bool highlighted;
  String myString;
  bool touchable;

  @override
  State<StatefulWidget> createState() =>
      _TileBox(highlighted, this.myString, this.touchable);
}

class _TileBox extends State<Tile> {
  _TileBox(this.highlighted, this.myString, this.touchable);
  bool highlighted;
  String myString;
  bool touchable;
  @override
  Widget build(BuildContext context) {
    var colorOffset = 0;

    if (highlighted) {
      developer.log('highlighted tile');
      colorOffset = 2;
    }

    developer.log("myString: " + myString);

    return GestureDetector(
        onTap: () {
          if (touchable) {
            setState(() {
              highlighted = true;
              playGame();
            });
          }
        },
        child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Stack(alignment: Alignment.center, children: [
              Box(70.0, false, colors[colorOffset + 0], highlighted),
              Box(50.0, true, colors[colorOffset + 1], highlighted),
              Text(myString,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'Heebo',
                    fontSize: 30,
                    shadows: [
                      Shadow(
                        color: Colors.blue.shade900.withOpacity(1),
                        offset: Offset(0, 0),
                        blurRadius: 15,
                      ),
                    ],
                  )),
            ])));
  }

  void playGame() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Game()))
        .then((value) => setState(() {
              highlighted = false;
            }));
  }
}
