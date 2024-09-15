import 'package:flutter/material.dart';




class WeightData extends ChangeNotifier{
 
 double weightData = 10.0;
 String weightFormat = 'kg';

 void setWeight(double weight){
  weightData = weight;
  notifyListeners();
 }

 void togglWeight(){
  if(weightFormat =='kg'){
    weightFormat = 'lbs';
  }
  else{
    weightFormat = 'kg';
  }
    notifyListeners();
 }

}