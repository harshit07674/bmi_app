import 'package:flutter/material.dart';




class HeightData extends ChangeNotifier{
 
 double heightData = 10;

 void setHeight(double height){
  heightData = height;

notifyListeners();
 }


}