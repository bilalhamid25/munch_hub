import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/screens/navigation_drawer/navigation_drawer_view.dart';

class SplashViewModel extends GetxController {
  @override
  void onReady() {
    super.onReady();
    startTime();
  }

  startTime() async {
    Timer(const Duration(milliseconds: 1000), loadNextScreen);
  }

  loadNextScreen() {
    GlobalVariables.token.value = GetStorage().read("token") ?? "";
    GlobalVariables.userFirstName.value =
        GetStorage().read("userFirstName") ?? "";
    GlobalVariables.userLastName.value =
        GetStorage().read("userLastName") ?? "";
    GlobalVariables.userEmail.value = GetStorage().read("userEmail") ?? "";
    try {
      Map<String, dynamic> data = (GetStorage().read("cartList") ?? {});
      var list = data["cartList"] as List;
      GlobalVariables.cartCount.value = list.length;
    } catch (_) {}
    Get.off(() => NavigationDrawerView());
  }
}
