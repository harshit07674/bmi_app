import 'package:bmi/providers/gender_data.dart';
import 'package:bmi/providers/weight_data.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  List<bool> isSelected = [true, false, false];

class CustomToggle extends StatefulWidget {
  
 final isGender;
 final double toggleWidth;
  const CustomToggle({super.key,required this.isGender,required this.toggleWidth});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
 
  @override
  Widget build(BuildContext context) {
    final gender = Provider.of<GenderData>(context);
    final weight = Provider.of<WeightData>(context);
    return  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
           Container(
            height: 50,
            width: widget.toggleWidth,
            decoration: BoxDecoration(
              color: AppColors.whiteShadeColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child:  Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        
       
                          if(widget.isGender){
                            gender.setGender(Gender.Female);
                          }
                          else{
                            weight.togglWeight();
                          }
                            
                          
                         
                        
                      },
                      child: Container(
                        width: widget.isGender?widget.toggleWidth/3:widget.toggleWidth/2,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: widget.isGender?gender.genderGroup==Gender.Female? AppColors.blueDisplayColor:AppColors.transparentColor:weight.weightFormat=='kg'? AppColors.blueDisplayColor:AppColors.transparentColor,
                        ),
                        child:Center(child:Text(widget.isGender?AppText.female:AppText.kg,style: TextStyle(color: widget.isGender?gender.genderGroup==Gender.Female?AppColors.whiteColor:AppColors.labelTextColor:weight.weightFormat=='kg'?AppColors.whiteColor:AppColors.labelTextColor,fontSize: 16,
                        ),),),
                        ),
                      ),
                    GestureDetector(
                      onTap: (){
                         
                         if(widget.isGender){
                            gender.setGender(Gender.Male);
                          }
                          else{
                            weight.togglWeight();
                          }
                            
                          
                          
                      },
                      child: Container(
                        width:  widget.isGender?widget.toggleWidth/3:widget.toggleWidth/2,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: widget.isGender?gender.genderGroup==Gender.Male? AppColors.blueDisplayColor:AppColors.transparentColor:weight.weightFormat=='lbs'? AppColors.blueDisplayColor:AppColors.transparentColor,
                        ),
                        child:Center(child:Text(widget.isGender?AppText.male:AppText.lbs,style: TextStyle(color:   widget.isGender?gender.genderGroup==Gender.Male?AppColors.whiteColor:AppColors.labelTextColor:weight.weightFormat=='lbs'?AppColors.whiteColor:AppColors.labelTextColor,fontSize: 16,
                        ),),),
                        ),
                      ),
                     widget.isGender?
                      GestureDetector(
                      onTap: (){
                      
                             gender.setGender(Gender.Others);
                         
                      },
                      child: Container(
                        width: widget.toggleWidth/3,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:gender.genderGroup==Gender.Others? AppColors.blueDisplayColor:AppColors.transparentColor,
                        ),
                        child:Center(child:Text(AppText.others,style: TextStyle(color: gender.genderGroup==Gender.Others?AppColors.whiteColor:AppColors.labelTextColor,fontSize: 16,
                        ),),),
                        ),
                      ):Container(),
                  ],
                )
            
           ),
          ],
        );



  }
}
