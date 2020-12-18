import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;
import 'package:box1/pages/game.dart';
import 'package:box1/widgets/box.dart';

const color0 = "#63d5ff";
const colors = ["#336cb3", "#34b7e8", "#44b7e8", "#54b7e8"];


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
  num outerBoxSize = 70.0;
  num innerBoxSize = 50.0;

  @override
  Widget build(BuildContext context) {
    var colorOffset = 0;

    if (highlighted) {
      developer.log('highlighted tile');
      colorOffset = 2;
      outerBoxSize = 70.0;
      innerBoxSize = 70.0;
    }

    developer.log("myString: " + myString);

    return GestureDetector(
        onTapDown: (tapDownDetails) {
          if (touchable) {
            setState(() {
              outerBoxSize = outerBoxSize*.8;
              innerBoxSize = innerBoxSize*.8;
            });
          }
        },
        onTapCancel: () {
          if (touchable) {
            setState(() {
              outerBoxSize = 70.0;
              innerBoxSize = 50.0;
            });
          }
        },
        onTapUp: (tapUpDetails) {
          if (touchable) {
            setState(() {
              highlighted = true;
              outerBoxSize = 0;
              playGame();
            });
          }
        },
        child: Padding(
            padding: EdgeInsets.all(14.0),
            child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: outerBoxSize),
                duration: Duration(milliseconds: 100),
                builder: (_, num myWidth, __) {
                  return Container(
                      width: 70.0,
                      height: 70.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Box(myWidth, false, colors[colorOffset + 0],
                            highlighted),
                        Box(myWidth * .7, true, colors[colorOffset + 1],
                            highlighted),
                        boxText(myString),
                      ]));
                })));
  }

  Widget boxText(myString) {
    return Text(myString,
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
        ));
  }
    void playGame() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Game()))
        .then((value) => setState(() {
              highlighted = false;
            }));
  }
}
