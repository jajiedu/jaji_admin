import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// We use get package for our state management

class SideMenuCtrl extends GetxController {
  // called immediately after the widget is allocated memory
  RxBool visibleOfMenuQs = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void updateVisible() {
    visibleOfMenuQs.update((val) {
      visibleOfMenuQs.value = !val!;
    });
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {}

  void updateTheQnNum(int index) {}
}
