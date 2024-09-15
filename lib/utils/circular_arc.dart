import 'package:flutter/material.dart';



class CircularArcPainter extends CustomPainter {

  final Color arcColor;

  final double arcStartAngle;

  final double arcSweepAngle;



  CircularArcPainter({required this.arcColor, required this.arcStartAngle, required this.arcSweepAngle});



  @override

  void paint(Canvas canvas, Size size) {

    final paint = Paint()..color = arcColor..style = PaintingStyle.stroke..strokeWidth=5;

    final center = Offset(size.width/92 , size.height );

    final radius = size.width;



    canvas.drawArc(

      Rect.fromCircle(center: center, radius: radius), 

      arcStartAngle,

      arcSweepAngle,

      false ,

      paint,

    );
   

  }



  @override

  bool shouldRepaint(CustomPainter oldDelegate) => true;

}