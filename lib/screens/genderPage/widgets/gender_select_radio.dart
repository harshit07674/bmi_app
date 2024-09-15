import 'package:bmi/providers/gender_data.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_images.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class GenderSelectionRadio extends StatefulWidget {

  GenderSelectionRadio({super.key});

  @override
  State<GenderSelectionRadio> createState() => _GenderSelectionRadioState();
}

class _GenderSelectionRadioState extends State<GenderSelectionRadio> {
 
  @override
  Widget build(BuildContext context) {
     final genderData = Provider.of<GenderData>(context);

    return  Column(
      
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Radio(value: Gender.Female, groupValue: genderData.genderGroup, onChanged: (value){
                    setState(() {
                      genderData.setGender(Gender.Female);
                    });
                  },
                  
                  fillColor: WidgetStateColor.resolveWith(
                (value){
                  if(genderData.genderGroup==Gender.Female){
                 return AppColors.blueDisplayColor;
                  }
                  else{
                    return AppColors.transparentColor;
                  }
                }
              ),
                  autofocus: true,
                  toggleable: true,
                  
            ),
                  
                  Container(
                  height: 164.11,
                  width: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.femaleGender),fit: BoxFit.contain,),
                  ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Radio(value: Gender.Male, groupValue: genderData.genderGroup, onChanged: (value){
                    setState(() {
                     genderData.setGender(Gender.Male);
                    });
                  },
                  
                  fillColor: WidgetStateColor.resolveWith(
                (value){
                  if(genderData.genderGroup==Gender.Male){
                 return AppColors.blueDisplayColor;
                  }
                  else{
                    return AppColors.transparentColor;
                  }
                }
              ),
                  autofocus: true,
                  toggleable: true,
                  ),
                  Container(
                  height: 164.11,
                  width: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.maleGender),fit: BoxFit.contain,),
                  ),
                  ),
                 
                ],
              ),
            
            ],
            ),
            Container(
              width: 170,
              alignment: Alignment.topRight,
              child: Radio(value: Gender.Others, groupValue: genderData.genderGroup, onChanged: (value){
                genderData.setGender(Gender.Others);
              },
              
              fillColor: WidgetStateColor.resolveWith(
                (value){
                  if(genderData.genderGroup==Gender.Others){
                 return AppColors.blueDisplayColor;
                  }
                  else{
                    return AppColors.transparentColor;
                  }
                }
              ),
              ),
            ),
          Container(
              height: 59,
              width: 149,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.othersButtonBorderColor, width: 1)),
              child: Center(
                child: 
                     
                    Center(
                      child: Text(
                        AppText.other,
                        style: TextStyle(
                            fontSize: 18, color: AppColors.topHeadingColor),
                      ),
                    ),
                  
              
              ),
            ),

      ],
    );
  }
}
