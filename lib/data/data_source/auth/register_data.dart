import 'dart:io';

import '../../../api_links.dart';
import '../../../shared/class/crud.dart';

class RegisterData {
  Crud crud;
  RegisterData(this.crud);

  Future<Map<String, dynamic>> postData({
    required String firstname,
    required String lastname,
    required String email,
    required String pass,
    required int salary,
    required String about,
    required String socialMedia,
    required String birthDate,
    required int type,
    required String tags,
    int? gender,
    File? avatar,
  }) async {
    var data = {
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "password": pass,
      "password_confirmation": pass,
      "tags[]": tags,
      "salary": salary.toString(),
      "gender": gender ?? '',
      "type": type.toString(),
      "birth_date": birthDate,
      "favorite_social_media[]": socialMedia,
      "about": about,
    };

    var response = await crud.postDataWithFile(
      AppLinks.register,
      data,
      avatar!,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Content-Type': 'multipart/form-data'
      },
    );

    return response;
  }
}
