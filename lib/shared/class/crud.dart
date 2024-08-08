import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:kafil/shared/class/statusrequest.dart';

import 'package:dartz/dartz.dart';
import '../functions/checkinternet.dart';

class Crud{

  Future<Either<StatusRequest, Map>> postData(String url, Map data, {Map<String, String>? headers}) async{
    try{
      if(await checkInternet()){
        print("hi");
        var response = await http.post(
            Uri.parse(url),
            body: data,
            headers: headers,
        );
        print("Response code is ${response.statusCode}");
        if(response.statusCode == 200 || response.statusCode == 201){
          Map responseBody = jsonDecode(response.body);
          print("done");
          return Right(responseBody);
        }
        else{
          return const Left(StatusRequest.serverFailure);
        }
      }
      else{
        return const Left(StatusRequest.offlineFailure);
      }
    }catch(e){
      print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }

  postDataWithFile(String url, Map data, File file, {Map<String, String>? headers}) async{
      var request = http.MultipartRequest("POST", Uri.parse(url));

      var len = await file.length();
      var stream = http.ByteStream(file.openRead());

      var multipartFile = http.MultipartFile("avatar", stream, len, filename: basename(file.path));

      request.files.add(multipartFile);

      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      if (headers != null) {
        request.headers.addAll(headers);
      }

      try{

      var myRequest = await request.send();

      var response = await http.Response.fromStream(myRequest);
      Map responseBody = jsonDecode(response.body);

      return responseBody;
      // if(response.statusCode == 200 || response.statusCode == 201){
      //   Map responseBody = jsonDecode(response.body);
      //   print("done");
      //   return responseBody;
      // }
      // else{
      //   print("statusCode is ${response.statusCode}");
      // }
    }catch(e){
      print("Error is ${e}");
      return {"error": "Exception: $e"};
    }

  }


  getData(String url, {Map<String, String>? headers}) async{
    try{
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.statusCode);
      var responseBody =  jsonDecode(response.body);

      return responseBody;
    }catch(e){
      print("Error Catch ${e}");
      //return {"error": "Exception: $e"};
    }
  }
}