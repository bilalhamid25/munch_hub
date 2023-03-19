import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/screens/cart/cart_model.dart';
import 'package:munch_hub/screens/restaurant_detail/restaurant_detail_viewmodel.dart';

class CartViewModel extends GetxController {
  RxInt cartProductLength = 0.obs;
  RxDouble grandTotal = 0.0.obs;

  List<CartModel> cartList = <CartModel>[].obs;

  @override
  void onClose() {
    super.onClose();
    saveInGetStorage();

    try {
      RestaurantDetailViewModel model = Get.find();
      model.cartList = cartList;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();

    try {
      Map<String, dynamic> data = (GetStorage().read("cartList") ?? {});
      var list = data["cartList"] as List;
      cartList.addAll(list.map((e) => CartModel.fromJson(e)));
    } catch (_) {}

    calculations();
  }

  onItemIncrementToCart(int index) {
    CartModel model = cartList[index];
    model.count = model.count! + 1;
    cartList[index] = model;
    calculations();
    saveInGetStorage();
  }

  onItemDecrementToCart(int index) {
    CartModel model = cartList[index];
    model.count = model.count! - 1;
    cartList[index] = model;
    calculations();
    saveInGetStorage();
  }

  onRemoveCartItem(int index) {
    cartList.removeAt(index);
    GlobalVariables.cartCount.value--;
    calculations();
    saveInGetStorage();
  }

  void calculations() {
    grandTotal.value = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      int count = cartList[i].count ?? 0;
      double price = cartList[i].price ?? 0;
      grandTotal.value += count * price;
    }
  }

  saveInGetStorage() {
    Map<String, dynamic> cartData = {
      "cartList": [
        for (int i = 0; i < cartList.length; i++) cartList[i].toJson()
      ]
    };
    GetStorage().write("cartList", cartData);
  }
}
