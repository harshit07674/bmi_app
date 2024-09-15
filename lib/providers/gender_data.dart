import 'package:flutter/material.dart';


enum Gender { Male, Female , Others } 

class GenderData extends ChangeNotifier{
 
 Gender genderGroup = Gender.Male;

 void setGender(Gender gend){
  genderGroup = gend;

notifyListeners();
 }


}