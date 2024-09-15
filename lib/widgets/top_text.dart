import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:flutter/material.dart';


class TopText extends StatelessWidget {
  final String heading;
  const TopText({super.key,required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Text(
                "${heading}",
                style: TextStyle(color: AppColors.topHeadingColor,fontWeight: FontWeight.bold,fontSize: 24),
              ),
            
            
            Text(
                AppText.personalizePlanText,
                style: TextStyle(color: AppColors.topSubHeadingColor,fontWeight: FontWeight.normal,fontSize: 18),
              ),
      ],
    );
  }
}