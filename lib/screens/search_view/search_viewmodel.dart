import 'package:get/get.dart';
import 'package:munch_hub/screens/home/home_model.dart';

class SearchViewModel extends GetxController {
  RxList<HomeModel> allRestaurantsList = <HomeModel>[].obs;
  RxList<HomeModel> filteredRestaurantsList = <HomeModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    allRestaurantsList = Get.arguments["restaurantsList"];
  }

  onTextChange(String value) {
    if (value.isNotEmpty) {
      filteredRestaurantsList.clear();
      filteredRestaurantsList.addAll(allRestaurantsList.where(
          (e) => e.companyName!.toLowerCase().contains(value.toLowerCase())));
    }
  }
}
