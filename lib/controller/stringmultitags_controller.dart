import 'package:get/get.dart';

class MultiTagsController extends GetxController {
  List<String> tags = <String>[];

  void addTag(String tag) {
    if (!tags.contains(tag)) {
      tags.add(tag);
      update();
    }
  }

  void removeTag(String tag) {
    tags.remove(tag);
    print(tags);
    update();
  }
}