import 'package:bmi/providers/height_data.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_images.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});
   
  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
     int count = 0;
  @override
  Widget build(BuildContext context) {
    final height = Provider.of<HeightData>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    Container(
                      height: 374,
                      alignment: Alignment.center,
                      child: Container(
                        height: 25,
                        width: 25,
                       decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.heightThumbPointer),fit: BoxFit.cover)),
                      ),
                    ),
                  
         Container(
                  height: 374,   
                  width: 89,
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: AppColors.whiteShadeColor,width: 7),right: BorderSide(color: AppColors.whiteShadeColor,width: 7),
                    top: BorderSide(color: AppColors.whiteShadeColor,width: 4),
                    bottom: BorderSide(color: AppColors.whiteShadeColor,width: 4)
                    )
                  ),
                  child: ListWheelScrollView.useDelegate(itemExtent: 60, childDelegate: ListWheelChildBuilderDelegate(builder: (context,index){
                   
                          return Column(
                        
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("${heightList[index]}",style: TextStyle(color: height.heightData==heightList[index].toDouble()?AppColors.blueDisplayColor:AppColors.labelTextColor
,fontSize: 16,fontWeight: height.heightData==heightList[index].toDouble()?FontWeight.bold:FontWeight.normal),),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: 30,
                                    height: 5,
                                    color:AppColors.whiteShadeColor,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                height: 5,
                                width: 15,
                                color: AppColors.whiteShadeColor,
                              )
                            ],
                          );
                        },childCount:heightList.length),
                         useMagnifier: true,
                         
                         onSelectedItemChanged: (value){
                          height.setHeight(heightList[value].toDouble());
                       
                            print(height.heightData);
                          
                         },
                        physics: BouncingScrollPhysics(),
                        diameterRatio: 50,
                        
                        ),
                      ),
      ],
    );
  }
}