import 'package:box1/classes/colorset.dart';
import 'package:flutter/material.dart';
import 'package:box1/widgets/tile.dart';
import 'dart:math';
import 'dart:developer' as developer;

class board {
  
  int tileCount = 5;
  colorset boardColor;
  double tileSize = 60.0;
  List tileStates;
  double boardWidth;
  double boardHeight;
  int sequenceLength = 10;
  List sequence = [];
  List boardModel = [];

  generateRandomSequence() {
  
    for (var i = 0; i < sequenceLength; i++) {
      var rn = new Random();
      var _randomRow = rn.nextInt(tileCount);
      var _randomCol = rn.nextInt(tileCount);
      var _randomID = {"row": _randomRow, "col": _randomCol};
      sequence.add(_randomID);
    }
   // developer.log(sequence.toString());
  }



// Zero out the entire Board
  void createEmptyBoardModel() {
    var modelLength = tileCount * tileCount;
    //developer.log("modelLength: " + modelLength.toString());

    for (var i = 0; i < modelLength; i++) {
      boardModel.add(false);
    }

    // developer.log("boardModel: " + boardModel.toString());
  }

  board( this.boardColor) {
      boardColor = boardColor;

      generateRandomSequence();
      createEmptyBoardModel();
      sequence.forEach( (pair) => {
        touchTile(pair)
      }
      
      );
     // developer.log("Game Board:" + boardModel.toString());
    }
  
  toggleTile(myID) {
      var index = myID["row"] * tileCount + myID["col"];
      developer.log('row: ' + myID['row'].toString() + ', col: ' + myID['col'].toString());
      developer.log('index: ' + index.toString());

    // Toggle the Tile
    if (boardModel[index] == false) {
      boardModel[index] = true;
    }
    else
    {
      boardModel[index] = false;
    }
  }
  // This is a call-back function for when a tile gets touched
  // so that the board can handle the data-model.

  touchTile(myID) {
    // Toggle the touched tile
     toggleTile(myID);

    // Toggle the Surrounding Tiles
    var above = {};
    var below = {};
    var left = {};
    var right = {};

    // Above
    if (myID["row"] > 0) {
      above = { "row": myID["row"]-1, "col": myID["col"]};
      toggleTile(above);
    } 

    // Below
    if (myID["row"] < tileCount-1) {
      below = { "row": myID["row"] +1, "col":myID["col"]};
      toggleTile(below);
    } 

    if (myID["col"] > 0) {
      left = { "row": myID["row"], "col": myID["col"] -1 };
      toggleTile(left);
    } 

    if (myID["col"] < tileCount-1) {
      right = {"row": myID["row"], "col": myID["col"] + 1};
      toggleTile(right);
    } 

  }

  produceRow( rowNum ) {
    var thisRow = <Widget>[];
    for (var i = 0; i < tileCount; i++) {
      // Color, highlighted, string, touchable, size
      var myID = {"row": rowNum, "col": i};
      var myIndex = rowNum * tileCount + i;
      thisRow.add(
        Tile(boardColor, boardModel[myIndex], "", true, tileSize, myID, touchTile)
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
        produceRow( i )
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