import 'dart:convert';
import 'package:bmi/utils/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:bmi/providers/gender_data.dart';

postPhysicalInfo(Gender gender,double height,double weight,String weightFormat) async{
     Map<String,dynamic> request = {
    "gender":"${gender.toString()}",
    "height":height.toInt(),
    "heightType":"CM",
    "weight":weight,
    "weightType":"${weightFormat.toString().toUpperCase()}"
  };
try{
  var response = await http.post(Uri.parse(ApiConstants.apiBaseUrl),
  
  body: jsonEncode(request),
  headers:{
  'Content-Type': 'application/json',
 'Authorization':'Bearer ${ApiConstants.bearerToken}'
 } );
  if(response.statusCode==200){
    var data = jsonDecode(response.body);
    print(data['data'].toString());
    return data['data'].toString();
  }
  else{
    print(response.statusCode);
    return 'error occurred';
  }
}
catch(e){
print(e);
return 'data cannot be posted';
}
}


