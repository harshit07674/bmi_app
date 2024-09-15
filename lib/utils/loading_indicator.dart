import 'package:bmi/utils/app_colors.dart';
import 'package:flutter/material.dart';



class RectangularLoadingIndicator extends CustomPainter {

  

  final int count;
  final int firstpadding;




  RectangularLoadingIndicator({required this.count,required this.firstpadding});



  @override

  void paint(Canvas canvas, Size size) {

    final paintProgress = Paint()..color = AppColors.blueDisplayColor..style = PaintingStyle.fill;
    final paintRest= Paint()..color = AppColors.whiteShadeColor..style = PaintingStyle.fill;

    for(int i =0;i<count;i++){

      canvas.drawRect(Rect.fromCenter(center: Offset(firstpadding-i*90,0), width: 80, height: 5), paintProgress);
      
    }

    if(count<4 && count!=2){
   for(int i =1;i<=4-count;i++){

      canvas.drawRect(Rect.fromCenter(center: Offset((1.83*count)*40-i*90,0), width: 80, height: 5), paintRest);
      
    }
    }
    if(count==2){
      canvas.drawRect(Rect.fromCenter(center: Offset(40,0), width: 80, height: 5), paintRest);
      canvas.drawRect(Rect.fromCenter(center: Offset(220-1*90,0), width: 80, height: 5), paintRest);
    }

  }




  @override

  bool shouldRepaint(CustomPainter oldDelegate) => true;

}