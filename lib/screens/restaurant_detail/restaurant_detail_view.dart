import 'dart:developer';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/getx_helper.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/screens/cart/cart_view.dart';
import 'package:munch_hub/screens/restaurant_detail/item_detail_model.dart'
    as detail;
import 'package:munch_hub/screens/restaurant_detail/menu_model.dart'
    as menu;
import 'package:munch_hub/screens/restaurant_detail/restaurant_detail_viewmodel.dart';
import 'package:munch_hub/widgets/custom_buttons.dart';
import 'package:munch_hub/widgets/loader.dart';

class RestaurantDetailView extends StatelessWidget {
  RestaurantDetailView({Key? key}) : super(key: key);
  final RestaurantDetailViewModel restaurantDetailViewModel =
      Get.put(RestaurantDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: appBar(),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [image(), restaurantDetails(), tabBar(), tabBarView()],
            ),
            const Loader()
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(title: const Text("Restaurant Detail"));
  }

  Widget image() {
    return Stack(
      children: [
        SizedBox(
          height: Get.height * 0.25,
          width: double.infinity,
          child: const Image(
            image: AssetImage("assets/images/img.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(150),
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              width: Get.width,
              color: Colors.black.withOpacity(0.3),
              child: Obx(
                () => Text(
                  restaurantDetailViewModel.restaurantDetail.value.name
                          ?.toUpperCase() ??
                      "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Positioned(right: 10, top: 10, child: cartWithBadge())
      ],
    );
  }

  Widget cartWithBadge() {
    return Obx(
      () => (GlobalVariables.cartCount.value > 0)
          ? Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(150),
                ),
              ),
              child: badges.Badge(
                badgeColor: Colors.white,
                badgeContent: Text(
                  "${GlobalVariables.cartCount.value}",
                  style: const TextStyle(color: Colors.red),
                ),
                position: BadgePosition.topEnd(top: 0, end: 0),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Get.to(() => CartView());
                  },
                ),
              ))
          : Container(),
    );
  }

  Widget restaurantDetails() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            const SizedBox(height: 5),
            restaurantContactNumber(),
            const SizedBox(height: 5),
            Text(restaurantDetailViewModel.restaurantDetail.value.description ??
                ""),
          ],
        ),
      ),
    );
  }

  Widget restaurantContactNumber() {
    return restaurantDetailViewModel.restaurantDetail.value.contactPhone != null
        ? Row(
            children: [
              const Icon(Icons.phone),
              const SizedBox(width: 5),
              Text(restaurantDetailViewModel
                      .restaurantDetail.value.contactPhone ??
                  '')
            ],
          )
        : Container();
  }

  Widget tabBar() {
    return Obx(
      () => TabBar(
        physics: const BouncingScrollPhysics(),
        overlayColor:
            MaterialStateProperty.all(Get.theme.primaryColor.withOpacity(0.2)),
        isScrollable: true,
        controller: restaurantDetailViewModel.categoriesTabController,
        unselectedLabelColor: const Color(0xff727475),
        labelColor: Get.theme.primaryColor,
        indicatorColor: Get.theme.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        // labelPadding: EdgeInsets.symmetric(horizontal: 10),
        tabs: [
          for (int i = 0; i < restaurantDetailViewModel.menuList.length; i++)
            Tab(
              child: Text(restaurantDetailViewModel.menuList[i].name!),
            )
        ].obs,
      ),
    );
  }

  Widget tabBarView() {
    return Obx(
      () => Expanded(
        child: TabBarView(
          controller: restaurantDetailViewModel.categoriesTabController,
          children: restaurantDetailViewModel.menuList.map(
            (menu.MenuModel model) {
              return productsListView(model);
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget productsListView(menu.MenuModel model) {
    return (model.items?.isNotEmpty ?? false)
        ? ListView.separated(
            padding: const EdgeInsets.only(bottom: 8),
            physics: const BouncingScrollPhysics(),
            itemCount: model.items?.length ?? 0,
            itemBuilder: (context, int index) {
              return productListViewItem(index, model);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 4,
                thickness: 0.7,
              );
            },
          )
        : Container(
            height: Get.height * 0.67,
            alignment: Alignment.center,
            child: Text('No item available for ${model.name}'),
          );
  }

  Widget productListViewItem(int index, menu.MenuModel model) {
    return InkWell(
      onTap: () {
        openBottomSheet(index, model);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //model.items![index].image ??
            productImage("sd.jpg"),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(model.items![index].name),
                    description(model.items![index].description),
                    // price(model.items![index].price.toString()),
                    price(index, model.items![index])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleText(String? title) {
    return Text(
      title ?? 'No Title',
      style: const TextStyle(
        fontSize: 14.5,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget description(String? description) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      child: Text(
        description ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget price(int index, menu.Items item) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Text(
                  'PKR : ',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  item.price.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productImage(String? img) {
    log(URLs.profileImages + (img ?? "notfound"));
    return SizedBox(
      width: 100,
      height: 100,
      child: CachedNetworkImage(
        imageUrl: URLs.profileImages + (img ?? "notfound"),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          padding: const EdgeInsets.all(30),
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Color(0xff801717),
          ),
        ),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/marker3.png'),
      ),
    );
  }

  void openBottomSheet(int index, menu.MenuModel model) async {
    await restaurantDetailViewModel.getProductDetail(model.items![index].id!);
    detail.ItemDetailModel itemDetail =
        restaurantDetailViewModel.itemDetails[model.items![index].id]!;

    restaurantDetailViewModel.selectedOptionOnBottomSheet.value = "";

    RxInt count = 1.obs;

    showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Get.theme.primaryColor, width: 1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  model.items![index].name ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(itemDetail.description ?? ""),
                itemOptions(itemDetail),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 95,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Get.theme.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              if (count > 1) {
                                count.value--;
                              }
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              size: 22,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Obx(
                              () => Text("$count"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              count.value++;
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 22,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    CustomButton2(
                      height: 30,
                      width: 90,
                      text: const Text(
                        'Add to Cart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      buttonColor: Get.theme.primaryColor,
                      onPressed: () {
                        if (itemDetail.modifiers!.isNotEmpty &&
                            restaurantDetailViewModel
                                    .selectedOptionOnBottomSheet.value ==
                                "") {
                          GetxHelper.showSnackBar1(
                              title: "Error",
                              message: "Please select at least one option");
                        } else {
                          Get.back();
                          restaurantDetailViewModel.addToCart(
                              count, model.items![index]);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget itemOptions(detail.ItemDetailModel itemDetail) {
    return (itemDetail.modifiers!.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                itemDetail.modifiers![0].name ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ...itemDetail.modifiers![0].options!.map(
                (e) {
                  return Row(
                    children: [
                      Obx(
                        () => Radio(
                          value: "${e.name}",
                          groupValue: restaurantDetailViewModel
                              .selectedOptionOnBottomSheet.value,
                          onChanged: (value) {
                            restaurantDetailViewModel
                                .selectedOptionOnBottomSheet
                                .value = value.toString();
                          },
                        ),
                      ),
                      Text("${e.name}")
                    ],
                  );
                },
              ),
            ],
          )
        : Container();
  }
}
