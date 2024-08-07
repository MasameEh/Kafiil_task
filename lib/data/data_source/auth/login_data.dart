import '../../../api_links.dart';
import '../../../shared/class/crud.dart';


class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData({
    required String email,
    required String pass,
  }) async
  {
    var response = await crud.postData(AppLinks.login,
        {
          "email": email,
          "password": pass,
        },
        // headers:{
        //         'Accept': 'application/json',
        //         'Accept-Language': 'ar',
        //         'Content-Type': 'application/json',
        // }
    );

    return response.fold((l) => l, (r) => r,);
  }
}