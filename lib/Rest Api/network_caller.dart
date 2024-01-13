import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:price_scrapper/Rest%20Api/network_response.dart';

class NetworkCaller{
  Future getRequest(String url)async{
    try{
      final Response response = await get(Uri.parse(url),
          headers: <String, String>{
            "Content-type": "application/json",
          });
      log(response.statusCode.toString());
      log(response.body.toString());
      if(response.statusCode == 200){
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
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