import 'package:get/get.dart';

class OperatorNavController extends GetxController {
  var isIndex = 0.obs;

  void onChangePage(int index) {
    isIndex.value = index;
  }
}
