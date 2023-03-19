import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/screens/cart/cart_view.dart';
import 'package:munch_hub/screens/home/home_viewmodel.dart';
import 'package:munch_hub/screens/restaurant_detail/restaurant_detail_view.dart';
import 'package:munch_hub/screens/search_view/search_view.dart';
import 'package:munch_hub/widgets/custom_drawer.dart';
import 'package:munch_hub/widgets/loader.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        drawer: const CustomDrawer(),
        backgroundColor: const Color(0xffF3F6F9),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userName(),
                  whatDoYouWant(),
                  searchTextField(),
                  restaurantListView(),
                ],
              ),
            ),
            const Loader()
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text("Munch Hub"),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Obx(
            () => (GlobalVariables.cartCount.value > 0)
                ? badges.Badge(
                    badgeColor: Colors.white,
                    badgeContent: Text(
                      "${GlobalVariables.cartCount.value}",
                      style: const TextStyle(color: Colors.red),
                    ),
                    position: BadgePosition.topEnd(top: 0, end: 0),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Get.to(() => CartView());
                      },
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.to(() => CartView());
                    },
                  ),
          ),
        )
      ],
    );
  }

  Widget userName() {
    return Padding(
        padding: const EdgeInsets.only(left: 14, top: 10),
        child: Obx(
          () => Text(
            (GlobalVariables.userFirstName.value == "")
                ? 'Welcome Back!'
                : "Hello! ${GlobalVariables.userFirstName.value}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff031F4B),
            ),
          ),
        ));
  }

  Widget whatDoYouWant() {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'What do you want to Eat?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3, left: 5),
            child: Icon(
              Icons.fastfood_sharp,
              size: 20,
              color: Color(0xff031F4B),
            ),
          )
        ],
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: 7.0,
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => SearchView(),
              arguments: {"restaurantsList": homeViewModel.allRestaurantsList});
        },
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.search,
              color: Colors.grey.shade400,
              size: 18,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                'Search Food',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget restaurantListView() {
    return Obx(
      () => (homeViewModel.allRestaurantsList.isNotEmpty)
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeViewModel.allRestaurantsList.length,
              itemBuilder: (BuildContext context, int index) {
                return restaurantListViewItem(index);
              },
            )
          : Container(),
    );
  }

  Widget restaurantListViewItem(int index) {
    return InkWell(
      onTap: () {
        Get.to(() => RestaurantDetailView(),
            arguments: {"id": homeViewModel.allRestaurantsList[index].id});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0.0, 0.0), //(x,y)
              blurRadius: 12,
              spreadRadius: 3,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            image(index),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 12, 4, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeViewModel.allRestaurantsList[index].companyName ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0C2E3A),
                    ),
                  ),
                  const Text(
                    '\$ 200',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE13F45),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 4, 4, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE13F45),
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(Icons.access_time,
                            size: 15, color: Colors.grey),
                      ),
                      Text(
                        '35 min',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget image(int index) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage("${URLs.profileImages}${homeViewModel.allRestaurantsList[index].profileImg}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
