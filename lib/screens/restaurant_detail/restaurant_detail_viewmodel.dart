import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_hub/helper/api_base_helper.dart';
import 'package:munch_hub/helper/getx_helper.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/screens/cart/cart_model.dart';
import 'package:munch_hub/screens/restaurant_detail/item_detail_model.dart';
import 'package:munch_hub/screens/restaurant_detail/menu_model.dart'
    as menu;
import 'package:munch_hub/widgets/loader.dart';

import 'restaurant_detail_model.dart';

class RestaurantDetailViewModel extends GetxController
    with GetTickerProviderStateMixin {
  List<menu.MenuModel> menuList = <menu.MenuModel>[].obs;
  late TabController categoriesTabController;
  int restaurantId = 0;
  Map<int, ItemDetailModel> itemDetails = {};
  Rx<RestaurantDetailModel> restaurantDetail = RestaurantDetailModel().obs;
  RxString selectedOptionOnBottomSheet = "".obs;
  List<CartModel> cartList = <CartModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    categoriesTabController = TabController(length: 0, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    restaurantId = Get.arguments["id"];
    getRestaurantDetails(restaurantId);
    getRestaurantMenu(restaurantId);

    try {
      Map<String, dynamic> data = (GetStorage().read("cartList") ?? {});
      var list = data["cartList"] as List;
      cartList.addAll(list.map((e) => CartModel.fromJson(e)));
    } catch (_) {}
  }


  void getRestaurantDetails(int restaurantId) {
    Loader.loader.value = true;
    String urls = "${URLs.restaurantsDetail}$restaurantId";
    ApiBaseHelper().get(url: urls).then((responseJson) async {
      try {
        if (responseJson["success"] == true) {
          restaurantDetail.value =
              RestaurantDetailModel.fromJson(responseJson['restaurant']);
        }
        Loader.loader.value = false;
      } catch (e) {
        Loader.loader.value = false;
        log(e.toString());
        GetxHelper.showSnackBar1(title: 'Error', message: e.toString());
      }
    });
  }

  void getRestaurantMenu(int restaurantId) {
    Loader.loader.value = true;
    String urls = "${URLs.restaurantsMenu}$restaurantId";
    ApiBaseHelper().get(url: urls).then((responseJson) async {
      try {
        if (responseJson["success"] == true) {
          var list = responseJson["menus"] as List;
          categoriesTabController =
              TabController(length: list.length, vsync: this);
          menuList.addAll(list.map((e) => menu.MenuModel.fromJson(e)));
        }
        Loader.loader.value = false;
      } catch (e) {
        Loader.loader.value = false;
        log(e.toString());
        GetxHelper.showSnackBar1(title: 'Error', message: e.toString());
      }
    });
  }

  Future getProductDetail(int itemId) async {
    log(itemDetails[itemId].toString());
    if (itemDetails[itemId] == null) {
      Loader.loader.value = true;
      String urls = "${URLs.menuDetail}$restaurantId/$itemId";
      await ApiBaseHelper().get(url: urls).then((responseJson) async {
        try {
          if (responseJson["success"] == true) {
            var list = responseJson["menus"] as List;
            ItemDetailModel itemDetail = ItemDetailModel.fromJson(list[0]);
            itemDetails[itemId] = itemDetail;
          }
          Loader.loader.value = false;
        } catch (e) {
          Loader.loader.value = false;
          log(e.toString());
          GetxHelper.showSnackBar1(title: 'Error', message: e.toString());
        }
      });
    }
  }

  addToCart(RxInt count, menu.Items items) {
    CartModel model = CartModel();
    model.count = count.value;
    model.id = items.id;
    model.name = items.name;
    model.description = items.description;
    model.hidequantityonreceipt = items.hidequantityonreceipt;
    model.categories = items.categories;
    model.price = items.price;
    model.tax = items.tax;
    model.isStock = items.isStock;
    model.temprature = items.temprature;
    model.image = items.image;
    model.dietaryAttributes = items.dietaryAttributes;
    model.modifierItems = items.modifierItems;
    model.energyValue = items.energyValue;
    cartList.add(model);

    saveInGetStorage();
  }

  saveInGetStorage() {
    Map<String, dynamic> cartData = {
      "cartList": [
        for (int i = 0; i < cartList.length; i++) cartList[i].toJson()
      ]
    };
    GetStorage().write("cartList", cartData);
    GlobalVariables.cartCount.value++;
  }
}
