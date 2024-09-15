import 'package:bmi/providers/weight_data.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightDisplayText extends StatelessWidget {
  const WeightDisplayText({super.key});

  @override
  Widget build(BuildContext context) {
    final weight = Provider.of<WeightData>(context);
    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Container(
                    width: 56.63,
                    height: 40,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text('${weight.weightData.toInt()}',style:TextStyle(color:AppColors.blueDisplayColor,fontWeight: FontWeight.bold)),
                    ),
                    
                   ),
                   const SizedBox(width: 10,),
                   Container(
                    width: 24.35,
                    height: 21.55,
                    margin: EdgeInsets.only(bottom: 5),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text('${weight.weightFormat}',style:TextStyle(color:AppColors.topHeadingColor,fontWeight: FontWeight.w500)),
                    ),
                    
                   ),
                 ],
               );
  }
}