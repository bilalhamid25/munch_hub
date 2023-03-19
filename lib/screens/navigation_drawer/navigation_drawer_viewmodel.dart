import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/screens/home/home_view.dart';
import 'package:munch_hub/screens/login_signup/login_signup_view.dart';
import 'package:munch_hub/screens/profile/profile_view.dart';

class NavigationDrawerViewModel extends GetxController {
  Widget selectView(int index, BuildContext context) {
    switch (index) {
      case 2:
        return HomeView();

      case 3:
        return (GlobalVariables.token.value == "")
            ? const LoginSignupView()
            : ProfileView();
      default:
        return SizedBox(
          height: double.infinity,
          width: Get.width,
          child: const Center(
            child: Text("Working on Design"),
          ),
          //  color: Colors.red,
        );
    }
  }

  assignIndex(int index) {
    // if (index == 0) {
    GlobalVariables.selectedIndex.value = index;
    // } else if (index == 1) {}
  }

  Future<bool> onBackPressed(BuildContext context) async {
    bool? value = false;
    if (GlobalVariables.selectedIndex.value != 2) {
      GlobalVariables.selectedIndex.value = 2;
      return value;
    } else {
      value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('Do you want to exit?'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
      return value! == true;
    }
  }
}
