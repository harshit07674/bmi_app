import 'package:bmi/providers/gender_data.dart';
import 'package:bmi/providers/height_data.dart';
import 'package:bmi/providers/weight_data.dart';
import 'package:bmi/screens/weightPage/widgets/weight_display._text.dart';
import 'package:bmi/screens/weightPage/widgets/weight_picker.dart';
import 'package:bmi/services/api_service.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:bmi/utils/loading_indicator.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/widgets/custom_toggle.dart';
import 'package:bmi/widgets/loading_circular_button.dart';
import 'package:bmi/widgets/top_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  ScrollController scroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final weight = Provider.of<WeightData>(context);
    final gender = Provider.of<GenderData>(context);
    final height = Provider.of<HeightData>(context);
    return LayoutBuilder(
      builder: (context,constraints) {
        return SafeArea(
          child: Scaffold(
           appBar: PreferredSize(preferredSize: Size(double.infinity,50), child: CustomAppbar(isSkip: false,action: (){
        
           },)),
            body: SingleChildScrollView(
              reverse: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   
                    //  SfRadialGauge(
                          
                    //   axes: [
                    //     RadialAxis(
                    //       showLabels: true,
                    //       showTicks: true,
                    //       tickOffset: -1,
                    //       minorTicksPerInterval: 5,
                    //       maximum: 200,
                    //       minimum: 10,
                    //       endAngle: -5.5,
                    //       startAngle: -175,
                    //       showAxisLine: false,
                    //       canRotateLabels: true,
                    //       interval: 10,
                    //       showLastLabel: true,
                    //       labelOffset: -30,
                    //       pointers: [
                    //          MarkerPointer(
                    //           borderWidth: 5,
                    //           color: Colors.black,
                    //           markerHeight: 20,
                    //           markerWidth: 5,
                    //           markerType: MarkerType.diamond,
                    //           markerOffset: 20,
                    //           value: weight.weightData
                    //           +      enableAnimation: true,
                    //       animationType: AnimationType.linear,
                    //           onValueChanged: (value){
                          
                    //               weight.setWeight(value);
                                 
                    //           },
                    //           onValueChanging: (value){
                                
                    //             weight.setWeight(value.value);
                    //           },
                    //           onValueChangeStart: (value){
                                
                    //             weight.setWeight(value);
                    //           },
                    //           enableDragging: true,
                    //           ),
                       const SizedBox(height: 30,),
                       CustomPaint(
                        painter: RectangularLoadingIndicator(count: 4,firstpadding: 130),
                       ),
                        
                        TopText(heading: AppText.weightPageHeadingText),
                        CustomToggle(isGender: false,toggleWidth: deviceWidth*0.87,),
                        WeightPicker(),
                        
                    // Center(
                    //   child: Container(
                    //     height: 100,
                    //     width: 200,
                    //     child: WeightSlider()),
                    // ),
                        
                   
                     
                    
                       WeightDisplayText(),
                        
                       LoadingCircularButton(action: () async{
                        String successOrErrorMessage= await postPhysicalInfo(gender.genderGroup,height.heightData,weight.weightData,weight.weightFormat);
                        setState(() {
                         
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${successOrErrorMessage}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.whiteColor),),backgroundColor: AppColors.backArrowIconColor,margin: EdgeInsets.only(bottom: 20),behavior: SnackBarBehavior.floating,));
                        
                        });
                       },
                         
                        arcStart: 3.14*2,arcEnd: 2*3.14,),
                        const SizedBox(height: 20,),
                              
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


 














// class CircularArcPainter extends CustomPainter {

//   final Color arcColor;

//   final double arcStartAngle;

//   final double arcSweepAngle;



//   CircularArcPainter({required this.arcColor, required this.arcStartAngle, required this.arcSweepAngle});



//   @override

//   void paint(Canvas canvas, Size size) {

//     final paint = Paint()..color = arcColor..style = PaintingStyle.stroke..strokeWidth=5;

//     final center = Offset(size.width/92 , size.height );

//     final radius = size.width;



//     canvas.drawArc(

//       Rect.fromCircle(center: center, radius: radius), 

//       arcStartAngle,

//       arcSweepAngle,

//       false,

//       paint,

//     );
   

//   }



//   @override

//   bool shouldRepaint(CustomPainter oldDelegate) => true;

// }
