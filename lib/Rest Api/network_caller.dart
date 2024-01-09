import 'dart:convert';
import 'package:http/http.dart';
import 'package:price_scrapper/Rest%20Api/network_response.dart';

class NetworkCaller{
  Future getRequest(String url)async{
    try{
      final Response response = await get(Uri.parse(url),
          headers: <String, String>{

          });
      if(response.statusCode == 200){
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
      }else if(response.statusCode ==401){
        return NetworkResponse(
            isSuccess: false, 
            jsonResponse: jsonDecode(response.body),
            statusCode: response.statusCode);
      }
      else{
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      }
    }
    catch(e){
      return NetworkResponse(
          isSuccess: false,
          errorMessage: e.toString());
    }
  }
}