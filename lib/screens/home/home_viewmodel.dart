// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/api_base_helper.dart';
import 'package:munch_hub/helper/getx_helper.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/screens/home/home_model.dart';
import 'package:munch_hub/widgets/loader.dart';

class HomeViewModel extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  RxList<HomeModel> allRestaurantsList = <HomeModel>[].obs;
  RxList<HomeModel> filteredRestaurantsList = <HomeModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    getRestaurantList();
  }

  @override
  void onClose() {
    super.onClose();
    searchTextEditingController.dispose();
  }

  void onSearchTextChange(String text) {
    filteredRestaurantsList.clear();
    filteredRestaurantsList.addAll(allRestaurantsList.where((e) =>
        e.companyName?.toLowerCase().contains(text.toLowerCase()) ?? false));
  }

  void getRestaurantList() async {
    Loader.loader.value = true;
    Map<String, dynamic> body = {
      "latitude": "42.502379",
      "longitude": "-71.07609"
    };
    ApiBaseHelper()
        .post(url: URLs.restaurantsList, body: body)
        .then((responseJson) async {
      try {
        if (responseJson["success"] == true) {
          var list = responseJson["restaurants"] as List;
          allRestaurantsList.addAll(list.map((e) => HomeModel.fromJson(e)));
          filteredRestaurantsList.addAll(allRestaurantsList);
        }
        Loader.loader.value = false;
      } catch (e) {
        Loader.loader.value = false;
        GetxHelper.showSnackBar1(title: 'Error', message: e.toString());
      }
    });
  }
}
