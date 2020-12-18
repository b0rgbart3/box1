// import Google's Material Design library
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;
import 'package:box1/widgets/tile.dart';
import 'package:box1/classes/colorset.dart';


class Intro extends StatelessWidget {

  // Color introColor = Colors.blue;
  colorset introColorSet = colorset(colorset.colorssets['blue']);

  num startTileSize = 70.0;

  @override
  Widget build(BuildContext context) {

    // developer.log("ColorSet: " + introColorSet.outside);

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
        Tile(introColorSet, false, "", false, startTileSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tile(introColorSet, false, "", false, startTileSize),
            Tile(introColorSet, false, "Play", true, startTileSize),
            Tile(introColorSet, false, "", false, startTileSize)
          ],
        ),
        Tile(introColorSet, false, "", false, startTileSize)
      ],
    );
  }
}


