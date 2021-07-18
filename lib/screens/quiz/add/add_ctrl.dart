import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// We use get package for our state management

class AddCtrl extends GetxController with SingleGetTickerProviderMixin {
  // called immediately after the widget is allocated memory
  RxString currentPage = 'home'.obs;
  @override
  void onInit() {
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {}
  void routerSetting(String name) {
    currentPage.update((val) {
      currentPage.value = name;
    });
  }

  void updateTheQnNum(int index) {}
}
