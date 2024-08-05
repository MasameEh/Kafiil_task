import 'dart:io';

import '../../../api_links.dart';
import '../../../shared/class/crud.dart';


class RegisterData{
  Crud crud;
  RegisterData(this.crud);

  postData({
    required String firstname,
    required String lastname,
    required String email,
    required String pass,
    required int salary,
    required String about,
    required List<String> socialMedia,
    required String birthDate,
    required int type,
    required int tags,
    String? gender,
    File? avatar,
  }) async
  {
    var response = await crud.postData(AppLinks.register,
        {
          "first_name" : firstname,
          "last_name" : lastname,
          "email" : email,
          "password" : pass,
          "password_confirmation" : pass,
          "tags" : tags,
          "salary" : salary,
          "gender" : gender,
          "type" : type,
          "birth_date" : birthDate,
          "favorite_social_media" : socialMedia,
          "avatar" : avatar,
        },
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
          'Accept-Language': 'ar', // If you need authorization
        },
    );

    return response.fold((l) => l, (r) => r,);
  }
}