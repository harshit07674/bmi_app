import 'package:bmi/providers/height_data.dart';
import 'package:bmi/screens/heightPage/widgets/height_picker.dart';
import 'package:bmi/screens/weightPage/weight_page.dart';
import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_images.dart';
import 'package:bmi/utils/app_texts.dart';
import 'package:bmi/utils/constants.dart';
import 'package:bmi/utils/loading_indicator.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/widgets/loading_circular_button.dart';
import 'package:bmi/widgets/top_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:provider/provider.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  RulerPickerController? rulerPickerController;
double heightValue = 145;

@override
  void initState() {
    // TODO: implement initState
     rulerPickerController = RulerPickerController(value: heightValue);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
  final height = Provider.of<HeightData>(context);
    return LayoutBuilder(
      builder: (context,constraints) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(preferredSize: Size(double.infinity, 50),
             child: CustomAppbar(action: (){
              height.setHeight(defaultHeightData);
              Navigator.push(context,new MaterialPageRoute(builder: (context)=>WeightPage()));
             },),
            
            ),
            body: SingleChildScrollView(
              reverse: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    CustomPaint(
                      painter: RectangularLoadingIndicator(count: 3,firstpadding: 40),
                    ),
                        
                        
                    //  Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         height: 5,
                    //         width: 80,
                    //         color: Color.fromRGBO(82, 46, 210, 1),
                    //       ),
                    //       Container(
                    //         height: 5,
                    //         width: 80,
                    //         color: Color.fromRGBO(82, 46, 210, 1),
                    //       ),
                    //       Container(
                    //         height: 5,
                    //         width: 80,
                    //         color: Color.fromRGBO(82, 46, 210, 1),
                    //       ),
                    //       Container(
                    //         height: 5,
                    //         width: 80,
                    //         color: Color.fromRGBO(241, 244, 248, 1),
                    //       ),
                    //     ],
                    //   ),
                        
                       
                  TopText(heading: AppText.heightPageHeadingText),
                        
                      // Transform.scale(
                      //   scale: -1,
                      //   child: SfSliderThemeData(
                      //     child: SfSlider.vertical(value: heightValue, onChanged: (value){
                      //             setState(() {
                      //               heightValue = value;
                      //               print(value);
                      //             });
                      //     },
                      //      showTicks: true,
                      //      min: 145,
                      //      minorTicksPerInterval: 1,
                      //      showLabels: true,
                      //      max: 190,
                      //      interval: 5,
                      //      activeColor: Colors.blue,
                      //      thumbShape: ThumbShape(),
                      //      labelPlacement: LabelPlacement.onTicks,
                           
                      //     ),
                      //   ),
                      // )
                        
                        
                      //  Transform.rotate(
                      //   angle: 1.57,
                      //    child: RulerPicker(
                      //                  controller: rulerPickerController!,
                      //                  onBuildRulerScaleText: (index, value) {
                      //     return value.toInt().toString();
                      //                  },
                      //                  ranges: ranges,
                         
                      //                  scaleLineStyleList: const [
                      //     ScaleLineStyle(
                      //         color: Colors.grey, width: 5, height: 30, scale: 0),
                      //     ScaleLineStyle(
                      //         color: Colors.grey, width: 5, height: 25, scale: 5),
                      //     ScaleLineStyle(
                      //         color: Colors.grey, width: 5, height: 15, scale: -1)
                      //                  ],
                         
                      //                  onValueChanged: (value) {
                      //     setState(() {
                      //       heightValue = value.toDouble();
                      //     });
                      //                  },
                      //                  width: MediaQuery.of(context).size.width,
                      //                  height: 80,
                      //                  rulerMarginTop: 18,
                                       
                      //                  marker: Container(
                      //                      width: 8,
                      //                      height: 50,
                      //                      decoration: BoxDecoration(
                      //                          color: Colors.red.withAlpha(100),
                      //                          borderRadius: BorderRadius.circular(5))),
                      //                ),
                      //  ),
                        
                      GestureDetector(
                        onTap: (){ 
                           
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.blueDisplayColor,
                          ),
                          child: Center(
                            child: Text(AppText.cm,style: TextStyle(color: AppColors.whiteColor,
                             fontSize: 16,                                                                                                
                             ),),
                          ),
                        ),  
                      ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Container(
                            height: 275.19,
                            width: 115.76,
                           decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppImages.heightDisplay),fit: BoxFit.cover)
                           ),
                          ),
                          const SizedBox(width: 30,),
                         
                        HeightPicker(),
                      ],
                    ),
                        
                    LoadingCircularButton(navigateTo:WeightPage(),arcStart: 3.14/2,arcEnd: 3*3.14/2, action: (){
                      
                    },),
                    const SizedBox(height: 20,),
                        ],
                      ),
              ),
            ),
                  )                
              
            
        
        );
      }
    );
  }
}