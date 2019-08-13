library round_painter;
import 'package:flutter/material.dart';

class RoundPainter extends CustomPainter {
 
  List<Offset> offsetList;
  List<double> radiusList;
  Color color;
 

  RoundPainter({this.offsetList,this.radiusList,this.color});


  @override
  void paint(Canvas canvas, Size size) {

    for (int i = 0; i < this.offsetList.length; i++) {
      var paint = new Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;

      canvas.drawCircle(this.offsetList[i], this.radiusList[i], paint);
    }
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
