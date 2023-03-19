import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/screens/cart/cart_view.dart';
import 'package:munch_hub/screens/profile/profile_viewmodel.dart';
import 'package:munch_hub/widgets/custom_drawer.dart';
import 'package:munch_hub/widgets/custom_text_fields.dart';
import 'package:munch_hub/widgets/loader.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final ProfileViewModel profileViewModel = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        drawer: const CustomDrawer(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  profileImage(),
                  firstNameTextField(),
                  lastNameTextField(),
                  emailTextField(),
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
      title: const Text("Profile"),
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

  Widget profileImage() {
    return Center(
      child: Container(
        width: 120,
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        child: Stack(
          children: [
            Positioned(
                left: 5,
                child: Container(
                  padding: const EdgeInsets.all(1.0),
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/account.png"),
                    ),
                  ),
                )),
            Positioned(
              bottom: 20,
              left: 90,
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.5)),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 15.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomTextField2(
        title: "First Name",
        controller: profileViewModel.firstNameController,
      ),
    );
  }

  Widget lastNameTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomTextField2(
        title: "Last Name",
        controller: profileViewModel.lastNameController,
      ),
    );
  }

  Widget emailTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomTextField2(
        title: "Email",
        controller: profileViewModel.emailController,
      ),
    );
  }
}
