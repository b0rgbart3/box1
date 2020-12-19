import 'package:flutter/material.dart';
import 'package:box1/models/board.dart';
import 'package:box1/classes/colorset.dart';
import 'dart:developer' as developer;

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State {
@override
  Widget build(BuildContext context) {

    board gameBoard = board( colorset(colorset.colorssets['blue']) );
    
    return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black,
      child: Column(
        children: [gameBoard.display(context),
        Container( 
        alignment: Alignment.bottomCenter,
        width:300.0,
        height:50.0,
        child:ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container( alignment: Alignment.center,child: Text('Go back!')) ,
        ),
      )]
      )
    );
  }

}