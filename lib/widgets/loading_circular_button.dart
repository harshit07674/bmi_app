import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/circular_arc.dart';
import 'package:flutter/material.dart';


class LoadingCircularButton extends StatelessWidget {
  final Widget? navigateTo;
  final Function action;
  final double? arcStart;
  final double? arcEnd;
  LoadingCircularButton({super.key, this.navigateTo,this.arcStart,this.arcEnd,required this.action});
  
  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   alignment: Alignment.topCenter,
    //     children: [
          //
          //  Positioned(
          //   top: 45,
          //   left: 57,
            // child:
              return  GestureDetector(
              onTap: (){
              
                navigateTo==null?
                action():Navigator.push(context, new MaterialPageRoute(builder: (context)=>navigateTo!));
              },
              child: 
                Container(
                height: 100,
                width: 90,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 44,right:15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[
                            AppColors.circularButonGradientColor,
                            AppColors.blueDisplayColor
                      
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                          ),
                          shape: BoxShape.circle
                        ),
                       child: Center(
                        child: Icon(Icons.arrow_forward,color: AppColors.whiteColor,size: 30,),
                       ), 
                      ),
                    ),
                    Align(alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(left: 20,),
            height: 70,
            width: 35,
            child: CustomPaint(
              painter: CircularArcPainter(arcColor: AppColors.blueDisplayColor, arcStartAngle: arcStart==null?3.14/2:arcStart!, arcSweepAngle: arcEnd==null?3.14:arcEnd!),
             
          ),
          ),
                    )
                  ],
                //),
              ),
            ),
          //),
          
         
        //]

      
    );
  }
}