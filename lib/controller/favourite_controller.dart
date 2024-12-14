import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<Map<String, dynamic>> data2 = [];
  void addFavourite(Map<String, dynamic> value) {
    if (data2.contains(value)) {
      data2.add(value);
      print('contain.......');
    } else {
      print('not contain.......');
      // data2.add(value);
    }
    data2.add(value);
    update();
  }
}
