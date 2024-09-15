import 'package:bmi/providers/gender_data.dart';
import 'package:bmi/screens/genderPage/widgets/gender_select_radio.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:bmi/utils/constants.dart';
import 'package:bmi/utils/loading_indicator.dart';
import 'package:bmi/widgets/custom_toggle.dart';
import 'package:bmi/widgets/top_text.dart';
import 'package:bmi/screens/heightPage/height_page.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/widgets/loading_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String gender = 'male';
  
  @override
  Widget build(BuildContext context) {
    final gender = Provider.of<GenderData>(context);
    return LayoutBuilder(
      builder: (context,constrints) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize( 
              preferredSize: Size(double.infinity,50),
              child: CustomAppbar(action: (){
                    gender.setGender(defaultGenderData);
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>HeightPage()));
              },)),
            body: SingleChildScrollView(
              reverse: true,
              child: ConstrainedBox(constraints: BoxConstraints(minHeight: constrints.maxHeight),child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                   const SizedBox(height: 50,),
                  
                  CustomPaint(
                    painter: RectangularLoadingIndicator(count: 2, firstpadding: -50),
                  ),
                    //  Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Container(
                    //       height: 5,
                    //       width: 80,
                    //       color: Color.fromRGBO(82, 46, 210, 1),
                    //     ),
                    //     Container(
                    //       height: 5,
                    //       width: 80,
                    //       color: Color.fromRGBO(82, 46, 210, 1),
                    //     ),
                    //     Container(
                    //       height: 5,
                    //       width: 80,
                    //       color: Color.fromRGBO(241, 244, 248, 1),
                    //     ),
                    //     Container(
                    //       height: 5,
                    //       width: 80,
                    //       color: Color.fromRGBO(241, 244, 248, 1),
                    //     ),
                    //   ],
                    // ),
                  
                  
                    
                   TopText(heading: AppText.genderPageHeadingText,),
                  
                   GenderSelectionRadio(),
                  CustomToggle(isGender: true,toggleWidth: 356,),
                  LoadingCircularButton(navigateTo: HeightPage(),action: (){
                    
                  },),
                  const SizedBox(height: 10,)
                ],
              ),
              ),
            ),
          ),
        );
      }
    );
  }
}
