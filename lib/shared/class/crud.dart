import 'dart:convert';

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
        print("${response.statusCode}");
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
}