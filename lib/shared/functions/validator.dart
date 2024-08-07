import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val.trim())) {
      return "invalid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val.trim())) {
      return "invalid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val.trim())) {
      return "invalid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
  return null;
}