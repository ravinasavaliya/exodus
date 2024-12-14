import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int pageIndex = 0;
  void changePage(int index) {
    pageIndex = index;
    update();
  }

  bool removeBottomBar = false;
  void setRemoveBottombar(bool value) {
    removeBottomBar = value;
    update();
  }
}
