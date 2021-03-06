import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;
import 'package:box1/pages/game.dart';
import 'package:box1/widgets/box.dart';
import 'package:box1/classes/colorset.dart';

// Color, highlighted, string, touchable, size
class Tile extends StatefulWidget {
  Tile(this.tileColor, this.highlighted, this.myString, this.touchable, this.size);
  colorset tileColor; 
  bool highlighted;
  String myString;
  bool touchable;
  num size;

  @override
  State<StatefulWidget> createState() =>
      _TileBox(tileColor, highlighted, myString, touchable, size);
}

class _TileBox extends State<Tile> {
  _TileBox(this.tileColor, this.highlighted, this.myString, this.touchable, this.size);
  colorset tileColor;
  bool highlighted;
  String myString;
  bool touchable;
  num size;
  num boxSize;
  String insideColor, outsideColor;


  // Set the initial size of the box - to the value that was passed in
  @override initState() {
      boxSize = size;
    }

  @override
  Widget build(BuildContext context) {
    
    // Convert the pased Color value into a hexadecimal string so we can 
    // manipulate it.
    // String myHexColor = baseColor.value.toRadixString(16);

    insideColor = tileColor.inside;
    outsideColor = tileColor.outside;

    if (highlighted) {
      boxSize = size;
      insideColor = tileColor.insideHi;
      outsideColor = tileColor.outsideHi;
    }
    developer.log("In Tile: tileSize: " + size.toString());

    return GestureDetector(
        onTapDown: (tapDownDetails) {
          if (touchable) {
            setState(() {
              boxSize = size*.8;
            });
          }
        },
        onTapCancel: () {
          if (touchable) {
            setState(() {
              boxSize = size;
            });
          }
        },
        onTapUp: (tapUpDetails) {
          if (touchable) {
            setState(() {
              highlighted = true;
              playGame();
            });
          }
        },
        child: Padding(
            padding: EdgeInsets.all(8),
            child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: boxSize),
                duration: Duration(milliseconds: 100),
                builder: (_, num myWidth, __) {
                  return Container(
                      width: size,
                      height: size,
                      child: Stack(alignment: Alignment.center, children: [
                        Box(myWidth, false, outsideColor,  
                            highlighted),
                        Box(myWidth * .75, true, insideColor,
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
