import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;
import 'package:box1/pages/game.dart';
import 'package:box1/widgets/box.dart';
import 'package:box1/classes/colorset.dart';


class Tile extends StatefulWidget {
  Tile(this.tileColor, this.highlighted, this.myString, this.touchable);
  colorset tileColor; 
  bool highlighted;
  String myString;
  bool touchable;

  @override
  State<StatefulWidget> createState() =>
      _TileBox(tileColor, highlighted, myString, touchable);
}

class _TileBox extends State<Tile> {
  _TileBox(this.tileColor, this.highlighted, this.myString, this.touchable);
  colorset tileColor;
  bool highlighted;
  String myString;
  bool touchable;
  num innerBoxSize = 50.0;
  num outerBoxSize = 70.0;
  String insideColor, outsideColor;


  @override
  Widget build(BuildContext context) {
    
    // Convert the pased Color value into a hexadecimal string so we can 
    // manipulate it.

    // String myHexColor = baseColor.value.toRadixString(16);

    var colorOffset = 0;
    insideColor = tileColor.inside;
    outsideColor = tileColor.outside;

    if (highlighted) {
      developer.log('highlighted tile');
      colorOffset = 2;
      outerBoxSize = 70.0;
      innerBoxSize = 70.0;
      insideColor = tileColor.insideHi;
      outsideColor = tileColor.outsideHi;
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
                        Box(myWidth, false, outsideColor,  
                            highlighted),
                        Box(myWidth * .7, true, insideColor,
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
