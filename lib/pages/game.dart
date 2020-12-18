
import 'package:flutter/material.dart';




class Game extends StatefulWidget {
  

  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State {
@override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),

    );
  }

}