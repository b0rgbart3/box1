// import Google's Material Design library
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as developer;

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.black,
        child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 300),
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
        tile(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tile(),
            playBox(),
            tile()
          ],
        ),
        tile()
      ],
    );
  }

Widget playBox() {
  return 
    Stack(
      alignment: AlignmentDirectional.center,
    children: [
    tile(), playText(),
    ]


  );
  
}

  Widget playText() {
    return Text(
      "Play",
      textAlign: TextAlign.center,
      style: TextStyle(
        color:Colors.white,
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
      )
    );
  }
  Widget tile() {
    return Padding(
        padding: EdgeInsets.all(14.0),
        child: Stack(children:[box(70), box(40)] )
        );
  }

  Widget box(size) {
    return Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#34b7e8"),
            boxShadow: [
              BoxShadow(color: darkerHex("#336cb3"), 
              blurRadius: 10,
              spreadRadius: 10),
            ],
          ),
        );
  }

  Color darkerHex(value) {

    developer.log(value, name: 'original hexString');
    var newString = value;
    developer.log(newString, name: 'newString');
    var nString = value.split('');
   // developer.log(nString.join(''), name: 'nString');
    var red = nString[1] + nString[2];
    var green = nString[3] + nString[4];
    var blue = nString[5] + nString[6];

     developer.log(red, name: 'red');

    var redInt = (int.parse(red, radix: 16) ).toInt();
    var greenInt = (int.parse(green, radix: 16) ).toInt();
    var blueInt = (int.parse(blue, radix: 16) ).toInt();
   
    developer.log(redInt.toString(), name: 'redInt');

    redInt = (redInt * .8).toInt();
    greenInt = (greenInt * .8).toInt();
    blueInt = (blueInt * .8).toInt();

    developer.log(redInt.toString(), name: 'redInt');
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

    developer.log(redHex.toString(), name: 'redHex');
    var hexString = "#" + redHex + greenHex + blueHex;
  
    developer.log(hexString, name: 'hexString');
    return HexColor(hexString);
  }
}
