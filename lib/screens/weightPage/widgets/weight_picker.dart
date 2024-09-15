import 'package:bmi/providers/weight_data.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final weight = Provider.of<WeightData>(context);
     
    // Stack(
    //   alignment: Alignment.topCenter,
    //   children: [
        // Positioned(top: 90,left:140,child: Transform.rotate(
        //   angle: -6.5,
        //   child: 
        
        // ),
        // ),
        return Container(
          height: 200,
          width: deviceWidth*0.8,
          child: Stack(
            children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.only(top: 100,right: 40),
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage(AppImages.weightPointer),fit: BoxFit.contain)
                        ),
                      ),
                ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width-20,
                      child: RotatedBox(quarterTurns: 1,child:  ListWheelScrollView.useDelegate(itemExtent:12, childDelegate: ListWheelChildBuilderDelegate(builder: (context,index){
                      return Row(
                        children: [
                        
                          index%5==0?Transform(
                          transform: Matrix4.rotationY(0.5),
                            
                            child: Container(child: Text("${index}",style: TextStyle(fontSize: 10,color: weight.weightData==index.toDouble()?AppColors.blueDisplayColor:AppColors.labelTextColor,fontWeight: weight.weightData==index.toDouble()?FontWeight.bold:FontWeight.normal),),margin: EdgeInsets.only(),)):Container(margin: EdgeInsets.only(left: 35),),
                            index%5==0? Transform(
                              transform:Matrix4.rotationY(0.5),
                              child: Container(
                              height: 2,
                              margin: EdgeInsets.only(left: 10),
                              width: 22,
                              color: Colors.black,
                                                  ),
                            ): Transform(
                              transform: Matrix4.rotationY(0.5
                              ),
                              child: Container(
                              height: 2,
                              width: 15,
                              color: Colors.black,
                                                  ),
                            ),
                        ],
                      );  
                      },
                      childCount: 200,
                      ),
                      perspective: 0.0004,
                       offAxisFraction: -15,
                       diameterRatio: 1,
                       onSelectedItemChanged: (value){
                        
                        weight.setWeight(value.toDouble());
                        print('${weight.weightData}');
                      }                                                                 ,
                      ),
                      ),
                    ),
                  ),
            ],
          ),
        );
        

                  
    //   ],
    // );
  }
}