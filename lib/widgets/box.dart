import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;
import 'package:box1/pages/game.dart';

class Box extends StatelessWidget {
  // darkerHex -- takes in a String that is a hexadecimal color value as a string
  // takes the RGB values as double char hex values - converts that to an inteber
  // then darkens it by .2% and then converts it back to a 2 char hex value
  // and then returns the new Color - based on the new hexadecimal string

  Color darkerHex(value) {
    //developer.log(value, name: 'original hexString');
    var newString = value;
    //developer.log(newString, name: 'newString');
    var nString = value.split('');
    // developer.log(nString.join(''), name: 'nString');
    var red = nString[1] + nString[2];
    var green = nString[3] + nString[4];
    var blue = nString[5] + nString[6];

    //developer.log(red, name: 'red');

    var redInt = (int.parse(red, radix: 16)).toInt();
    var greenInt = (int.parse(green, radix: 16)).toInt();
    var blueInt = (int.parse(blue, radix: 16)).toInt();

    //developer.log(redInt.toString(), name: 'redInt');

    redInt = (redInt * .8).toInt();
    greenInt = (greenInt * .8).toInt();
    blueInt = (blueInt * .8).toInt();

    //developer.log(redInt.toString(), name: 'redInt');
    if (redInt < 0) {
      redInt = 0;
    }

    if (greenInt < 0) {
      greenInt = 0;
    }

    if (blueInt < 0) {
      blueInt = 0;
    }

    var redHex = redInt.toRadixString(16);
    var greenHex = greenInt.toRadixString(16);
    var blueHex = blueInt.toRadixString(16);

    //developer.log(redHex.toString(), name: 'redHex');
    var hexString = "#" + redHex + greenHex + blueHex;

    //developer.log(hexString, name: 'hexString');
    return HexColor(hexString);
  }

  Box(this.boxSize, this.light, this.boxColor, this.highlighted);
  final double boxSize;
  final bool light;
  final String boxColor;
  final bool highlighted;
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
    return Container(
      alignment: Alignment.center,
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
        boxShadow: [
          BoxShadow(
              color: glowColor, blurRadius: 10, spreadRadius: boxSpreadRadius),
        ],
      ),
    );
  }
}