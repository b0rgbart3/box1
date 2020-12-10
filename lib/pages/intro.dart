// import Google's Material Design library
import 'package:flutter/material.dart';

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
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: 'Heebo',
      ),
    );
  }

  Widget cross() {
    return Column(
      children: [
        box(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [box(), box(), box()],
        ),
        box()
      ],
    );
  }

  Widget box() {
    return Padding( 
      padding: EdgeInsets.all(14.0),
      child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue,
            boxShadow: [
              BoxShadow(color: Colors.blue, spreadRadius: 11),
            ],
          ),
    )
    );
  }
}
