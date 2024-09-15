import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget {
    final bool? isSkip ;
    final Function action;
   const CustomAppbar({super.key,this.isSkip,required this.action});
  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                        Navigator.pop(context);
                    },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        semanticLabel: "Back Arrow",
                        color: AppColors.backArrowIconColor,
                      ),
                    ),
                    isSkip!=null && isSkip==false?const Text(''):TextButton(
                        onPressed: () {
                          action();
                        },
                        child: const Text(
                          AppText.skipText,
                          style: TextStyle(
                              color: AppColors.blueDisplayColor,
                              fontSize: 20),
                        ))
                  ],
                
              );
  }
}