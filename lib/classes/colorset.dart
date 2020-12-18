

// ColorSets are my static pre-defined sets of 4 colors 
// the instantiated colorset will split those up into named variables

class colorset {
  String outside,inside,outsideHi,insideHi;
  List set;

  static const colorssets = { "blue": ["#336cb3", "#34b7e8", "#44b7e8", "#54b7e8"],
                     "red": ["#cf1f25", "#ff1d58","#ff5a7c","#ff8888"]
                   };

  colorset( this.set ) {
    outside = set[0];
    inside = set[1];
    outsideHi = set[2];
    insideHi = set[3];
  }



}