import 'package:box1/classes/colorset.dart';
import 'package:flutter/material.dart';
import 'package:box1/widgets/tile.dart';
import 'dart:developer' as developer;

class board {
  
  int tileCount = 5;
  colorset boardColor;
  double tileSize = 60.0;
  List tileStates;
  double boardWidth;
  double boardHeight;

  board( this.boardColor) {
      boardColor = boardColor;
    }

  produceRow() {
    var thisRow = <Widget>[];
    for (var i = 0; i < tileCount; i++) {
      // Color, highlighted, string, touchable, size
      thisRow.add(
        Tile(boardColor, false, "", true, tileSize)
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: thisRow
    );
  }

  produceColumns() {

    var myChildren = <Widget>[];
    for (var i =0; i < tileCount; i++) {
      myChildren.add(
        produceRow()
      );
    }

    return myChildren;
  }

produceBoard() {
  tileSize = (boardWidth *.8) / tileCount;
  // developer.log("Width: " + screenWidth.toString());
  // developer.log("Height: " + screenHeight.toString());
  // developer.log("tileCount: " + tileCount.toString());
  // developer.log("tileSize: " + tileSize.toString());

  return Padding( 
    padding: EdgeInsets.symmetric(vertical: 100.0),
    child:Column(
    
    children: produceColumns()
      
   ));
}

display(BuildContext context) {
    boardWidth = MediaQuery.of(context).size.width;
    boardHeight = MediaQuery.of(context).size.height;

    // developer.log("Width: " + myWidth.toString());
    // developer.log("Height: " + myHeight.toString());

    return Container( 
     
    child: 
      produceBoard()
    
    );
    
   
  }

}